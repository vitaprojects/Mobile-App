import 'package:flutter/material.dart';
import 'package:newpostman1/features/post_itinerary/presentation/post_your_itinerary_form_view_model.dart';
import 'package:newpostman1/useful/globals.dart';
import 'package:stacked/stacked.dart';

class PlaneTicketPreview
    extends ViewModelWidget<PostYourItineraryFormViewModel> {
  PlaneTicketPreview({Key key}) : super(key: key);
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context, PostYourItineraryFormViewModel model) {
    return Container(
      height: blockHeight * 10,
      width: blockHeight * 8,
      // color: Colors.green,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            height: blockHeight * 10,
            width: blockHeight * 8,
            // color: Colors.yellow,
            alignment: Alignment.center,
            child: (model.getflightTicket != null)
                ? Image.file(
                    model.getflightTicket,
                    height: blockHeight * 10,
                    width: blockHeight * 8,
                    fit: BoxFit.cover,
                  )
                : Container(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: blockHeight * 3,
              width: blockHeight * 3,
              child: RaisedButton(
                onPressed: () {
                  model.removeImage();
                },
                padding: EdgeInsets.all(
                  0,
                ),
                child: Container(
                  height: blockHeight * 3,
                  width: blockHeight * 3,
                  // color: Colors.redAccent,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.close,
                    size: blockHeight * 3,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
