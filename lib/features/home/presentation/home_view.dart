import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:newpostman1/features/drawer/presentation/pages/DrawerWidget.dart';
import 'package:newpostman1/features/home/domain/listen_to_events_service.dart';
import 'package:newpostman1/features/home/presentation/mode_selection_view.dart';
import 'package:newpostman1/features/home/presentation/home_view_model.dart';
import 'package:newpostman1/useful/globals.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:stacked/stacked.dart';

class HomePage extends StatefulWidget {
  ///This is the [`home page`] of the app
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ListenToEventsService listenToEventsService =
      locator<ListenToEventsService>();

  @override
  void initState() {
    super.initState();
    //adding the listeners in the initstate
    listenToEventsService.displayAlertForNewRequest();
    listenToEventsService.displayAlertForNewResponseFromPostman();
  }

  ///We save all the [`pages`] that we need to load in the [`home page`] here
  final pages = [
    Container(
      child: ModeSelectionView(
        assetName: "assets/images/travel.png",
        bodyText: "Make money anywhere you go",
        buttonText: "post itenary",
        pageNum: 0,
      ),
    ),
    Container(
      child: ModeSelectionView(
        assetName: "assets/images/sendPackage.png",
        bodyText: "Provide package details and find  a postman",
        buttonText: "send package",
        pageNum: 1,
        // methodInButton: () {
        //   print("send");
        // },
      ),
    ),
    Container(
      child: ModeSelectionView(
        assetName: "assets/images/errand2.png",
        bodyText: "Pay postman to do your local chores fast",
        buttonText: "run your errand",
        pageNum: 2,
        // methodInButton: () {
        //   print("send");
        // },
      ),
    ),
  ];

  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();

  void _toggle() {
    _innerDrawerKey.currentState.toggle(
        // direction is optional
        // if not set, the last direction will be used
        //InnerDrawerDirection.start OR InnerDrawerDirection.end
        // direction: InnerDrawerDirection.end,
        );
  }

  openDrawer() {
    _innerDrawerKey.currentState.open(
      direction: InnerDrawerDirection.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return ViewModelBuilder<HomeViewModel>.reactive(
        builder: (_, model, child) {
          return SafeArea(
              child: InnerDrawer(
            key: _innerDrawerKey,
            onTapClose: true,
            leftChild: Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: DrawerWidget(
                closeDrawer: () {
                  _toggle();
                },
              ),
            ),
            colorTransitionChild: Globals.mainColor,
            colorTransitionScaffold: Colors.black54, // default Color.black54
            borderRadius: 50, // default 0
            leftAnimationType: InnerDrawerAnimation.static, // default static
            rightAnimationType: InnerDrawerAnimation.quadratic,
            // offset: IDOffset.only(right: 0.0, left: 0.0),
            backgroundDecoration: BoxDecoration(color: Colors.white),

            rightChild: Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: DrawerWidget(
                closeDrawer: () {
                  _toggle();
                },
              ),
            ),
            swipe: true,
            scaffold: Scaffold(
              backgroundColor: Colors.white,
              // appBar: AppBar(
              //   backgroundColor: Colors.white,
              //   elevation: 0,
              //   leading: Icon(
              //     Icons.menu,
              //     color: Colors.black,
              //   ),
              // ),
              body: Column(
                children: [
                  Container(
                    height: blockHeight * 15,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: blockHeight * 8,
                            // color: Colors.orange,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: blockHeight * 8,
                                  width: blockWidth * 20,
                                  // color: Colors.yellow,
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: blockHeight * 6,
                                    width: blockHeight * 6,
                                    // color: Colors.orange,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        )),
                                    alignment: Alignment.center,
                                    child: IconButton(
                                      padding: EdgeInsets.all(
                                        0,
                                      ),
                                      icon: Icon(
                                        Icons.menu,
                                        size: blockHeight * 5,
                                      ),
                                      onPressed: () {
                                        openDrawer();
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                  height: blockHeight * 7,
                                  width: blockHeight * 7,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    // color: Colors.red,
                                  ),
                                  alignment: Alignment.center,
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                      "assets/images/user.png",
                                    ),
                                    radius: blockHeight * 3.5,
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                                Container(
                                  height: blockHeight * 8,
                                  width: blockWidth * 20,
                                  // color: Colors.yellow,
                                ),
                              ],
                            )),
                        Container(
                          height: blockHeight * 5,
                          // color: Colors.blue,
                          alignment: Alignment.center,
                          child: Container(
                            height: blockHeight * 4,
                            // color: Colors.yellow,
                            alignment: Alignment.center,
                            child: AutoSizeText(
                              "welcome back".toUpperCase(),
                              style: TextStyle(
                                fontSize: 25,
                              ),
                              minFontSize: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: LiquidSwipe(
                    pages: pages,
                    liquidController: LiquidController(),
                    enableSlideIcon: true,
                    waveType: WaveType.liquidReveal,
                  ))
                ],
              ),
            ),
          ));
        },
        viewModelBuilder: () => HomeViewModel());
  }
}
