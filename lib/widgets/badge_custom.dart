import 'package:flutter/material.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/shared/text_styles.dart';

// ignore: must_be_immutable
class BadgeCustom extends StatelessWidget {
  String title;
  BadgeCustom({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 8
      ),
      decoration: BoxDecoration(
        color: green1,
        borderRadius: BorderRadius.circular(4)
      ),
      child: Text(
        title,
        style: xSmall.white.regularF,
      ),
    );
  }
}