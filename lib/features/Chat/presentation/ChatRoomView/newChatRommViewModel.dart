import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newpostman1/features/Chat/data/chat_service.dart';
import 'package:newpostman1/models/user/UserModel.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:firebase_storage/firebase_storage.dart';

class NewChatRoomViewModel extends ChangeNotifier {
  String hellow = 'afsal';
  final ChatService chatService = locator<ChatService>();

  final TextEditingController messageController = TextEditingController();
  List<File> imagesOfThePackage = [];
  final picker = ImagePicker();

  String get title => messageController.text.toString();

  Future sendMessagwe(UserModel userModel) async {
    chatService.sendMessage(
        messageController.text.trim(), userModel.email, false);
    print(messageController.text.toString());
    messageController.clear();
  }

  Future getImage(int type,UserModel userModel) async {
    //this function is used to  upload pictures
    PickedFile pickedFile;
    File croppedFile;
    if (type == 0) {
      pickedFile = await picker.getImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.getImage(source: ImageSource.gallery);
    }

    if (pickedFile != null) {
      croppedFile = await ImageCropper.cropImage(
          sourcePath: pickedFile.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'Add your image',
              toolbarColor: Colors.blue,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              activeControlsWidgetColor: Colors.blue,
              lockAspectRatio: false),
          iosUiSettings: IOSUiSettings(
            minimumAspectRatio: 1.0,
          ));
    }

    if (croppedFile != null) {
      // imagesOfThePackage.add(croppedFile);
      _uploadToStorageTask(userModel,croppedFile);
      // notifyListeners();
    }
  }

  _uploadToStorageTask(UserModel userModel,File file) async {
    print('*****************************Stratedd uploading stask');
    StorageReference reference = FirebaseStorage.instance
        .ref()
        .child('Chats/')
        .child(DateTime.now().microsecondsSinceEpoch.toString());

    await reference
        .putFile(file)
        .onComplete
        .then((value) async {
      String url = await value.ref.getDownloadURL();
      print('*****************************Stratedd dowloading url');
      chatService.sendMessage(url, userModel.email, true);
    });
  }
}
