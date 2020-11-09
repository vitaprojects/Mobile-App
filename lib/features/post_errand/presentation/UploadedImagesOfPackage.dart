import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/features/post_errand/presentation/PostErrandFormViewModel.dart';
import 'package:stacked/stacked.dart';

import '../../../useful/globals.dart';

class UploadedImagesOfPackage extends ViewModelWidget<PostErrandFormViewModel> {
  UploadedImagesOfPackage({Key key}) : super(key: key);
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context, PostErrandFormViewModel model) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: blockWidth * 5,
      ),
      elevation: 20,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        10,
      )),
      child: Container(
        // height: blockHeight * 21,
        // color: Colors.red,
        padding: EdgeInsets.symmetric(
          horizontal: blockHeight,
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              height: blockHeight * 5,
              // color: Colors.green,
              alignment: Alignment.center,
              child: Container(
                height: blockHeight * 2.5,
                // color: Colors.yellow,
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  "Photos",
                  style: TextStyle(
                    fontSize: 16,
                    color: Globals.mainColor,
                  ),
                  minFontSize: 12,
                ),
              ),
            ),
            Container(
              height: blockHeight * 12,
              // color: Colors.yellow,
              alignment: Alignment.center,
              child: (model.imagesOfTheErrand.length == 0)
                  ? Container(
                      height: blockHeight * 10,
                      // color: Colors.redAccent,
                      alignment: Alignment.center,
                      child: Text(
                        "Upload images of the item",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: model.imagesOfTheErrand.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: blockHeight * 12,
                          color: Colors.grey.shade300,
                          margin: EdgeInsets.only(
                            right: blockWidth * 2,
                          ),
                          width: blockHeight * 10,
                          alignment: Alignment.center,
                          child: Image.file(
                            model.imagesOfTheErrand[index],
                            height: blockHeight * 12,
                            width: blockHeight * 10,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
            ),
            SizedBox(
              height: blockHeight * 2,
            ),
            Container(
              height: blockHeight * 8,
              // color: Colors.yellow,
              alignment: Alignment.center,
              child: Container(
                height: blockHeight * 5,
                // color: Colors.redAccent,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                        10,
                      )),
                      color: Globals.mainColor,
                      onPressed: () {
                        model.getImage(0);
                      },
                      padding: EdgeInsets.all(
                        0,
                      ),
                      child: Container(
                        width: blockWidth * 40,
                        // color: Colors.yellowAccent,
                        alignment: Alignment.center,
                        child: Container(
                          height: blockHeight * 2.5,
                          // color: Colors.yellow,
                          alignment: Alignment.center,
                          child: AutoSizeText(
                            "Take photo",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            minFontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                        10,
                      )),
                      color: Globals.mainColor,
                      onPressed: () {
                        model.getImage(1);
                      },
                      padding: EdgeInsets.all(
                        0,
                      ),
                      child: Container(
                        width: blockWidth * 40,
                        // color: Colors.yellowAccent,
                        alignment: Alignment.center,
                        child: Container(
                          height: blockHeight * 2.5,
                          // color: Colors.yellow,
                          alignment: Alignment.center,
                          child: AutoSizeText(
                            "Choose from gallery",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            minFontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: blockHeight,
            ),
          ],
        ),
      ),
    );
  }
}
