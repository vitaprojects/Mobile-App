import 'package:flutter/material.dart';
import 'package:newpostman1/features/home/data/OrderModel.dart';
import 'package:newpostman1/features/ongoing-orders/presentation/pages/ongoing_order_view_model.dart';
import 'package:newpostman1/features/ongoing-orders/presentation/widgets/order_complete_reject_button.dart';
import 'package:newpostman1/features/ongoing-orders/presentation/widgets/view_item_location_button.dart';
import 'package:newpostman1/useful/globals.dart';
import 'package:stacked/stacked.dart';

class OngoingOrderView extends StatelessWidget {
  OngoingOrderView({
    this.orderModel,
  });
  final OrderModel orderModel;
  final double blockHeight = Globals.blockHeight;

  final double blockWidth = Globals.blockWidth;

  final double margin = Globals.blockWidth * 5;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OngoingOrderViewModel>.reactive(
        onModelReady: (model) {
          model.initializeData(orderModel);
        },
        builder: (ctx, model, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Globals.mainColor,
              title: Text("Ongoing Order"),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: blockHeight * 10,
                    alignment: Alignment.center,
                    child: Text(
                      orderModel.type == 1
                          ? "Order Type :  Package".toUpperCase()
                          : "Order Type :  Errand".toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(
                              20,
                            ),
                            bottomRight: Radius.circular(
                              20,
                            ))),
                    margin: EdgeInsets.all(0),
                    child: Container(
                      height: blockHeight * 5,
                      // color: Colors.red,
                      alignment: Alignment.center,
                      child: Text("Order ID : " + orderModel.orderID),
                    ),
                  ),
                  (model.isDataLoaded)
                      ? Container(
                          height: blockHeight * 15,
                          // color: Colors.red,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ViewItemLocationButton(
                                buttonTitle: "View Item departure location",
                                locationModel: model.departureLocationModel,
                              ),
                              SizedBox(
                                width: blockWidth * 5,
                              ),
                              ViewItemLocationButton(
                                buttonTitle: "View Item destination location",
                                locationModel: model.destinationLocationModel,
                              ),
                            ],
                          ),
                        )
                      : CircularProgressIndicator(),
                  Container(
                    height: blockHeight * 10,
                    // color: Colors.green,
                    alignment: Alignment.center,
                    child: Text(
                      "Customer email : ${orderModel.postmanEmail}",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Divider(
                    height: blockHeight,
                    color: Colors.black,
                    thickness: blockHeight / 4,
                  ),
                  Container(
                    height: blockHeight * 10,
                    // color: Colors.green,
                    alignment: Alignment.center,
                    child: Text(
                      "Order value : ${orderModel.subtotal}",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Divider(
                    height: blockHeight,
                    color: Colors.black,
                    thickness: blockHeight / 4,
                  ),
                  Container(
                    height: blockHeight * 10,
                    // color: Colors.green,
                    alignment: Alignment.center,
                    child: Text(
                      "Your earning : ${model.currentIncomeFromTheORder}",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Divider(
                    height: blockHeight,
                    color: Colors.black,
                    thickness: blockHeight / 4,
                  ),
                  Container(
                    height: blockHeight * 10,
                    // color: Colors.green,
                    alignment: Alignment.center,
                    child: Text(
                      "Customer Tip : ${orderModel.tipAmount}",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Divider(
                    height: blockHeight,
                    color: Colors.black,
                    thickness: blockHeight / 4,
                  ),
                  Container(
                    height: blockHeight * 15,
                    // color: Colors.orange,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OrderCompleteRejectButton(
                            btnText: "Complete Order", btnType: 0),
                        SizedBox(
                          width: blockWidth * 10,
                        ),
                        OrderCompleteRejectButton(
                            btnText: "Reject Order", btnType: 1),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        viewModelBuilder: () => OngoingOrderViewModel());
  }
}
