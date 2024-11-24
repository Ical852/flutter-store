import 'package:flutter/material.dart';
import 'package:flutterstore/widgets/drawer_title_desc.dart';
import 'package:flutterstore/widgets/screens/add/price_items/row_price_item.dart';

// ignore: must_be_immutable
class LimitDrawer extends StatelessWidget {
  int currentLimit;
  Function(int) onPress;

  LimitDrawer({
    super.key,
    required this.currentLimit,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    var limits = [
      [10, 20],
      [50, 100],
      [250, 500],
    ];

    bool isPriceActive(limit) {
      return currentLimit == limit;
    }

    return StatefulBuilder(
      builder: ((BuildContext context, StateSetter setState) {
        return Container(
          margin: EdgeInsets.only(top: 32, left: 24, right: 24),
          child: ListView(
            children: [
              DrawerTitleDesc(
                title: 'Choose Limit',
                desc: 'You can set your products pagination limit with the value down below',
              ),
              SizedBox(height: 24),
              Column(
                children: limits.map((limit) {
                  return RowPriceItem(
                    leftPrice: limit[0],
                    rightPrice: limit[1],
                    onLeft: () => onPress(limit[0]),
                    onRight: () => onPress(limit[1]),
                    leftActive: isPriceActive(limit[0]),
                    rightActive: isPriceActive(limit[1]),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      }),
    );
  }
}
