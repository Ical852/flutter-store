import 'package:flutter/material.dart';
import 'package:flutterstore/widgets/drawer_title_desc.dart';
import 'package:flutterstore/widgets/screens/add/price_items/row_price_item.dart';

// ignore: must_be_immutable
class PriceDrawer extends StatelessWidget {
  Function(int, Function) setFastPrice;
  Function(int) isPriceActive;

  PriceDrawer({
    super.key,
    required this.setFastPrice,
    required this.isPriceActive,
  });

  var prices = [
    [50000, 100000],
    [200000, 300000],
    [500000, 1000000],
  ];

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((BuildContext context, StateSetter setState) {
      return Container(
        margin: EdgeInsets.only(top: 32, left: 24, right: 24),
        child: ListView(
          children: [
            DrawerTitleDesc(
              title: 'Instant Prices',
              desc: 'You can choose selectable price to set your product price.',
            ),
            SizedBox(height: 24),
            Column(
              children: prices.map((price) {
                return RowPriceItem(
                  leftPrice: price[0],
                  rightPrice: price[1],
                  onLeft: () => setFastPrice(price[0], setState),
                  onRight: () => setFastPrice(price[1], setState),
                  leftActive: isPriceActive(price[0]),
                  rightActive: isPriceActive(price[1]),
                );
              }).toList(),
            ),
          ],
        ),
      );
    }));
  }
}
