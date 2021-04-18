//this widget is created when the user wants to select whether post iternary or send a package
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/features/home/presentation/mode_selection_view_model.dart';
import 'package:newpostman1/useful/globals.dart';
import 'package:stacked/stacked.dart';
// import '';

class ModeSelectionView extends StatelessWidget {
  ModeSelectionView({
    this.assetName,
    this.bodyText,
    this.buttonText,
    // this.methodInButton,
    this.pageNum,
  });
  final String assetName;
  final String bodyText;
  final String buttonText;
  // final Function methodInButton;
  // final bool isFirstPage;
  final int pageNum;
  // final ErrandService errandService = locator<ErrandService>();

  // final SnackbarService

  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return ViewModelBuilder<ModeSelectionViewModel>.nonReactive(
        builder: (context, model, child) {
          return Container(
            height: blockHeight * 85,
            // child: child,
            // color: Colors.green,
            alignment: Alignment.center,
            child: Column(
              children: [
                Expanded(
                    child: Stack(
                  children: [
                    Container(
                      height: blockHeight * 65,
                      // color: Colors.orange,
                      alignment: Alignment.center,
                      child: Image.asset(
                        assetName,
                        fit: BoxFit.contain,
                        height: blockHeight * 65,
                      ),
                    ),
                    Align(
                      alignment: (pageNum % 2 == 0)
                          ? Alignment.bottomCenter
                          : Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: blockWidth * 5,
                        ),
                        height: blockHeight * 15,
                        // color: Colors.green,
                        alignment: Alignment.center,
                        child: Container(
                          height: blockHeight * 10,
                          // color: Colors.yellow,
                          alignment: Alignment.center,
                          child: AutoSizeText(
                            bodyText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            minFontSize: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
                Container(
                  height: blockHeight * 20,
                  // color: Colors.yellow,
                  alignment: Alignment.center,
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      if (pageNum == 0) {
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: blockWidth * 5,
                              ),
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                  25,
                                )),
                                color: Globals.mainColor,
                                padding: EdgeInsets.all(
                                  0,
                                ),
                                onPressed: () {
                                  model.navigateToPage(0);
                                },
                                child: Container(
                                  height: blockHeight * 6,
                                  // color: Colors.green,
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: blockHeight * 4,
                                    // color: Colors.redAccent,
                                    alignment: Alignment.center,
                                    child: AutoSizeText(
                                      buttonText.toUpperCase(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      minFontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: blockHeight * 1,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: blockWidth * 5,
                              ),
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                  25,
                                )),
                                color: Globals.mainColor,
                                padding: EdgeInsets.all(
                                  0,
                                ),
                                onPressed: () {
                                  model.runForErrand();
                                },
                                child: Container(
                                  height: blockHeight * 6,
                                  // color: Colors.green,
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: blockHeight * 4,
                                    // color: Colors.redAccent,
                                    alignment: Alignment.center,
                                    child: AutoSizeText(
                                      "post for  errands".toUpperCase(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      minFontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: blockWidth * 5,
                          ),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                              25,
                            )),
                            color: Globals.mainColor,
                            padding: EdgeInsets.all(
                              0,
                            ),
                            onPressed: () {
                              if (pageNum == 1) {
                                model.navigateToPage(1);
                              } else {
                                model.navigateToPage(2);
                              }
                            },
                            child: Container(
                              height: blockHeight * 6,
                              // color: Colors.green,
                              alignment: Alignment.center,
                              child: Container(
                                height: blockHeight * 4,
                                // color: Colors.redAccent,
                                alignment: Alignment.center,
                                child: AutoSizeText(
                                  buttonText.toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  minFontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          );
        },
        viewModelBuilder: () => ModeSelectionViewModel());
  }
}
