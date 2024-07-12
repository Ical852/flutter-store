import 'package:flutter/material.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/shared/text_styles.dart';

// ignore: must_be_immutable
class PriceItem extends StatelessWidget {
  int price;
  Function() onPress;
  bool active;

  PriceItem({
    required this.price,
    required this.onPress,
    this.active = false
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          color: active ? green1 : whiteColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: blackColor.withOpacity(0.2),
              blurRadius: 2,
              offset: Offset(0, 2)
            )
          ],
        ),
        child: Center(
          child: Text(
            rawMoneyFormat(price),
            style: mega.regularF.copyWith(
              color: active ? whiteColor : black1
            ),
          ),
        ),
      ),
    );
  }
}
