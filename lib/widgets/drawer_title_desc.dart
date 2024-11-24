import 'package:flutter/material.dart';
import 'package:flutterstore/shared/text_styles.dart';

// ignore: must_be_immutable
class DrawerTitleDesc extends StatelessWidget {
  String title, desc;

  DrawerTitleDesc({
    required this.title,
    required this.desc
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: medium.black1S.semiBold),
          SizedBox(height: 4),
          Text(desc, style: small.black1S.regularF),
        ],
      ),
    );
  }
}
