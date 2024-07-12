import 'package:flutter/material.dart';
import 'package:flutterstore/widgets/screens/add/price_items/price_item.dart';

// ignore: must_be_immutable
class RowPriceItem extends StatelessWidget {
  int leftPrice, rightPrice;
  bool leftActive, rightActive;
  Function() onLeft, onRight;

  RowPriceItem({
    required this.leftPrice,
    required this.rightPrice,
    this.leftActive = false,
    this.rightActive = false,
    required this.onLeft,
    required this.onRight}
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 7),
      child: Row(
        children: [
          Expanded(
            child: PriceItem(
              price: leftPrice,
              onPress: onLeft,
              active: leftActive,
            )
          ),
          SizedBox(width: 7),
          Expanded(
            child: PriceItem(
              price: rightPrice,
              onPress: onRight,
              active: rightActive,
            )
          ),
        ],
      ),
    );
  }
}
