import 'package:flutter/material.dart';
import 'package:newpostman1/features/post_itenary/presentation/PostYourItenaryFormViewModel.dart';
import 'package:stacked/stacked.dart';

import '../../../useful/globals.dart';

class UploadPlaneTicketWidget
    extends ViewModelWidget<PostYourItenaryFormViewModel> {
  UploadPlaneTicketWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, PostYourItenaryFormViewModel model) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        20,
      )),
      margin: EdgeInsets.symmetric(
        horizontal: blockWidth * 5,
      ),
      elevation: 20,
      child: Container(
        height: blockHeight * 15,
        // color: Colors.green,

        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              height: blockHeight * 5,
              // color: Colors.red,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                left: blockWidth * 3,
              ),
              child: Text(
                "upload ticket".toUpperCase(),
                style: TextStyle(
                  fontSize:
                      15, //TODO check the font size of each formfiled title
                  color: Globals.mainColor,
                ),
              ),
            ),
            (model.getflightTicket == null)
                ? Container(
                    height: blockHeight * 10,
                    color: Colors.green,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                            15,
                          )),
                          onPressed: () {
                            print("upload plane ticket from camera");
                            model.getImage(0);
                          },
                          padding: EdgeInsets.all(
                            0,
                          ),
                          child: Container(
                            height: blockHeight * 6,
                            width: blockWidth * 30,
                            // color: Colors.red,
                            alignment: Alignment.center,
                            child: Container(
                              height: blockHeight * 5,
                              width: blockHeight * 5,
                              // color: Colors.yellow,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.camera,
                                size: blockHeight * 5,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: blockWidth * 5,
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                            15,
                          )),
                          onPressed: () {
                            model.getImage(1);
                          },
                          padding: EdgeInsets.all(
                            0,
                          ),
                          child: Container(
                            height: blockHeight * 6,
                            width: blockWidth * 30,
                            // color: Colors.red,
                            alignment: Alignment.center,
                            child: Container(
                              height: blockHeight * 5,
                              width: blockHeight * 5,
                              // color: Colors.yellow,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.photo_album,
                                size: blockHeight * 5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
                : Container(
                    height: blockHeight * 10,
                    color: Colors.orange,
                  )
          ],
        ),
      ),
    );
  }
}
