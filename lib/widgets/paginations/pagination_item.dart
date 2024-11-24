import 'package:flutter/material.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/shared/text_styles.dart';

// ignore: must_be_immutable
class PaginationItem extends StatelessWidget {
  dynamic page, current;
  Function() onPress;

  PaginationItem({
    super.key,
    required this.page,
    required this.current,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    bool isCurrent() {
      return page == current;
    }

    TextStyle getStyle() {
      if (isCurrent()) return regular.white.semiBold;
      return small.pageS.regularF;
    }

    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: isCurrent() ? 32 : 28,
        height: isCurrent() ? 32 : 28,
        decoration: BoxDecoration(
          color: isCurrent() ? green1 : whiteColor,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: border),
        ),
        child: Center(
          child: Text(
            page.toString(),
            style: getStyle(),
          ),
        ),
      ),
    );
  }
}