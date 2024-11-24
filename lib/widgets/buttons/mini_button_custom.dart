import 'package:flutter/material.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/shared/text_styles.dart';

// ignore: must_be_immutable
class MiniButtonCustom extends StatelessWidget {
  String title;
  double? width, height;
  Function() onPressed;

  MiniButtonCustom({
    required this.title,
    required this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: green1,
      ),
      width: width ?? 200,
      height: height ?? 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent.withOpacity(0.1),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: medium.white.mediumF,
        ),
      ),
    );
  }
}
