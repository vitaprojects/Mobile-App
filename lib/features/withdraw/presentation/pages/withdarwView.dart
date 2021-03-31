import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpostman1/customWidgets/FormButton.dart';
import 'package:newpostman1/customWidgets/textCustom.dart';
import 'package:newpostman1/features/withdraw/presentation/widgets/listTileCustom.dart';
import 'package:newpostman1/features/withdrawToBank/presentation/pages/withdrawToBankView.dart';
import 'package:newpostman1/features/withdrawToStripe/presentation/pages/withdrawToStripe.dart';
import 'package:newpostman1/useful/globals.dart';

class WithdrawView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextCustom(
            marginTop: blockHeight * 20 / 4,
            color: Globals.mainColor,
            fontSize: blockHeight * 20 / 4,
            marginLeft: 18,
            fontWeight: FontWeight.bold,
          ),
          TextCustom(
            text: 'You can withdraw your balance here.',
            marginLeft: 18,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          ListTileCustom(),
          ListTileCustom(
            marginTop: 10,
            mainText: 'Transfers:',
            secondaryText: 'In Active',
            isError: true,
          ),
          // ButtonCustom(
          //   onTap: () {},
          // ),
          ButtonCustom(
            text: 'Withdraw moeny to stripe',
            onTap: () {
              Get.to(WithdrawToStrpeView());
            },
          ),
          ButtonCustom(
            marginTop: 5 / 4,
            text: 'withdraw money to bank',
            onTap: () {
              Get.to(WithdrawToBankView());
            },
          ),
        ],
      ),
    );
  }
}

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    Key key,
    this.text,
    @required this.onTap,
    this.marginTop = 45,
    this.marginBottom = 0,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;
  final double marginTop;
  final double marginBottom;

  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;
    return Container(
      margin: EdgeInsets.only(
          top: blockHeight * marginTop, bottom: blockHeight * marginBottom),
      child: FormButton(
        buttonText: text ?? 'create stripe account',
        ontapFun: onTap,
      ),
    );
  }
}
