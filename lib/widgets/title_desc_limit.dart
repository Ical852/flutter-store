import 'package:flutter/material.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/shared/text_styles.dart';
import 'package:flutterstore/widgets/image_custom.dart';

// ignore: must_be_immutable
class TitleDescLimit extends StatelessWidget {
  String title, desc, limit;
  bool isEmpty;
  Function() onPress;

  TitleDescLimit({
    super.key,
    required this.title,
    required this.desc,
    required this.limit,
    required this.onPress,
    this.isEmpty = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget Toggle() {
      if (isEmpty) return Container();
      return Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: green3)
        ),
        child: Row(
          children: [
            Text(
              limit,
              style: regular.black1S.regularF,
            ),
            SizedBox(width: 10),
            ImageCustom(
              height: 8,
              width: 16,
              image: AssetImage(getIC("ic_down.png")),
            )
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: regular.black1S.semiBold,
                  ),
                  Text(
                    desc,
                    style: small.grey1S.regularF,
                  )
                ],
              ),
            ),
            Toggle()
          ],
        ),
      ),
    );
  }
}
