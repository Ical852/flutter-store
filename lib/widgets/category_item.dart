import 'package:flutter/material.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/shared/text_styles.dart';

// ignore: must_be_immutable
class CategoryItem extends StatelessWidget {
  String current, title;
  Function() onPress;

  CategoryItem({
    super.key,
    required this.current,
    required this.title,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    bool isCurrent = current == title;

    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(right: 16),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isCurrent ? green1 : whiteColor,
          border: isCurrent ? null : Border.all(
            color: green1
          )
        ),
        child: Text(
          title,
          style: regular.copyWith(
            fontWeight: isCurrent ? fontMedium : fontLight,
            color: isCurrent ? whiteColor : green1
          ),
        ),
      ),
    );
  }
}
