import 'package:flutter/material.dart';
import 'package:newpostman1/features/authentication/domain/auth_service.dart';
import 'package:newpostman1/models/user/UserModel.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:stacked/stacked.dart';

import 'chatMessageBuilderViewModel.dart';

class ChatmessagesBuilderView extends StatefulWidget {
  ChatmessagesBuilderView(
      {Key key, @required this.userModel, @required this.scrollController})
      : assert(userModel != null, 'user model cannot be null'),
        assert(scrollController != null, 'Scroll controller cannot be null'),
        super(key: key);
  final UserModel userModel;
  final ScrollController scrollController;

  @override
  _ChatmessagesBuilderViewState createState() =>
      _ChatmessagesBuilderViewState();
}

class _ChatmessagesBuilderViewState extends State<ChatmessagesBuilderView> {
  final authService = locator<AuthenticationService>();
  ///*[`ScrollController`] to be used 
  ScrollController scrollController;

  ///* Scroll listner function `[ScrollController.addlistner] `
  ///*this is derived from scroll controllers
  scrolllistner() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      print('Reached the bottom ********************************************');
    }

    if (scrollController.offset <= scrollController.position.minScrollExtent &&
        !scrollController.position.outOfRange) {
      print(
          'reached top*******************************************************');
    }
  }

  double position;

  @override
  void initState() {
    scrollController = widget.scrollController ?? ScrollController();
    scrollController.addListener(scrolllistner);
    WidgetsBinding.instance.addPostFrameCallback(widgetZBuilt);
    super.initState();
  }

  /// * this is post frame call back execution this is used to scroll the user to the bottom `[Future] is used because `
  /// * of the async of the fiestore loading this will take some time to load the data ..
  void widgetZBuilt(Duration duration) {
    Future.delayed(Duration(milliseconds: 80), () {
      double initPos = scrollController.position.maxScrollExtent;
      print('initPos  $initPos');
      if (initPos != 0.0) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent + 150);
      }
      // scrollController.animateTo(initPos,
      //     duration: const Duration(milliseconds: 150), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatMessagesBuilderViewmodel>.reactive(
      builder: (context, model, widgett) {
        if (model.isBusy) {
          CircularProgressIndicator();
        }
        print(model.listModels == null
            ? 'Null'
            : 'has data ${model.listModels.length}');

        return ListView.builder(
          shrinkWrap: true,
          // key: model.chatViewKey,
          controller: scrollController,
          physics: AlwaysScrollableScrollPhysics(),
          itemCount:
              model.listModels != null ? model.listModels.length ?? 0 : 0,
          itemBuilder: (context, index) {
            ///!checking for the users identity this can be done in the view model too
            return model.showMessage(model, index, widget.userModel);
          },
        );
      },
      viewModelBuilder: () => ChatMessagesBuilderViewmodel(),
    );
  }
}
