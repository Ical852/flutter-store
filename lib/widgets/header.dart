import 'package:flutter/material.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/shared/text_styles.dart';
import 'package:flutterstore/widgets/image_custom.dart';

// ignore: must_be_immutable
class Header extends StatelessWidget {
  String title;
  Function()? onBack;

  Header({
    super.key,
    this.onBack,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if (onBack != null) onBack!();
              Navigator.pop(context);
            },
            child: ImageCustom(
              height: 24,
              width: 24,
              image: AssetImage(getIC("ic_back.png")),
            ),
          ),
          Text(
            title,
            style: regular.black1S.semiBold,
          ),
          SizedBox(width: 24),
        ],
      ),
    );
  }
}
