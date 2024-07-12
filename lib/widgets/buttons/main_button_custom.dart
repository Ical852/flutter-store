import 'package:flutter/material.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/shared/text_styles.dart';

// ignore: must_be_immutable
class MainButtonCustom extends StatelessWidget {
  Function() onPressed;
  String title;
  bool disabled;

  MainButtonCustom({
    required this.onPressed,
    required this.title,
    this.disabled = false
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disabled ? 0.3 : 1,
      child: Container(
        decoration: BoxDecoration(
          color: green1,
          borderRadius: BorderRadius.circular(8)
        ),
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent.withOpacity(0.1),
          ),
          onPressed: disabled ? () {} : onPressed,
          child: Text(
            title,
            style: medium.white.mediumF
          ),
        ),
      ),
    );
  }
}
