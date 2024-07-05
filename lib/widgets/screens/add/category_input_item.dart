import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/shared/text_styles.dart';
import 'package:flutterstore/widgets/screens/add/circle_indicator.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryInputItem extends StatelessWidget {
  String title;
  bool active;
  Function() onPress;
  CategoryInputItem(
      {required this.title, required this.onPress, this.active = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        height: 45,
        color: active ? green7.withOpacity(0.3) : whiteColor,
        child: Row(
          children: [
            CircleIndicator(
              active: active,
            ),
            SizedBox(
              width: 12,
            ),
            Text(title, style: medium.black.regularF)
          ],
        ),
      ),
    );
  }
}
