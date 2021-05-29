import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpostman1/features/home/data/OrderModel.dart';
import 'package:newpostman1/features/ongoing-orders/presentation/pages/ongoing_order_view.dart';
import 'package:newpostman1/useful/globals.dart';

class OngoingOrderCardWidget extends StatelessWidget {
  OngoingOrderCardWidget({
    this.orderModel,
  });
  final double blockHeight = Globals.blockHeight;

  final double blockWidth = Globals.blockWidth;

  final double margin = Globals.blockWidth * 5;
  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(OngoingOrderView(
          orderModel: orderModel,
        ));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 10,
        margin: EdgeInsets.only(
          bottom: blockHeight * 2,
          left: blockWidth * 5,
          right: blockWidth * 5,
        ),
        child: Container(
          height: blockHeight * 15,
          // color: Colors.red,

          alignment: Alignment.center,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  // color: Colors.yellow,
                  alignment: Alignment.center,
                  child: Text(
                    "Order ID : ${orderModel.orderID}",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  // color: Colors.green,
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      SizedBox(
                        width: blockWidth * 5,
                      ),
                      Text("Tip : ${orderModel.tipAmount}"),
                      SizedBox(
                        width: blockWidth * 10,
                      ),
                      Text("Your Fee : ${orderModel.postmanFee}"),
                      Expanded(
                          child: Container(
                        // color: Colors.red,
                        alignment: Alignment.center,
                        child:
                            Text(orderModel.type == 1 ? "Package" : "Errand"),
                      ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
