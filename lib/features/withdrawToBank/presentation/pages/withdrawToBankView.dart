import 'package:flutter/material.dart';
import 'package:newpostman1/customWidgets/CustomInputField.dart';
import 'package:newpostman1/customWidgets/textCustom.dart';
import 'package:newpostman1/features/withdraw/presentation/pages/withdarwView.dart';
import 'package:newpostman1/useful/globals.dart';

class WithdrawToBankView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            TextCustom(
              marginTop: blockHeight * 20 / 4,
              color: Globals.mainColor,
              fontSize: blockHeight * 20 / 4,
              marginLeft: 18,
              fontWeight: FontWeight.bold,
            ),
            TextCustom(
              text:
                  'You can withdraw your earnings to your bank account from your stripe account here.',
              marginLeft: 18,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            Container(
              child: CustomInputField(
                labelText: 'Enter amount to withdraw',
              ),
              margin: EdgeInsets.only(left: 22, right: 22, top: 40),
              height: blockHeight * 50 / 6,
            ),
            ButtonCustom(
              onTap: () {},
              marginTop: 55,
              text: 'Withdraw',
              marginBottom: 15 / 4,
            )
          ],
        ),
      ),
    );
  }
}
