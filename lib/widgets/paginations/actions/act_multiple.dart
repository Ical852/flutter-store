import 'package:flutter/material.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/widgets/image_custom.dart';

// ignore: must_be_immutable
class ActMultiple extends StatelessWidget {
  String action = "end";
  Function() onPress;

  ActMultiple({
    super.key, 
    required this.action,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    String getIcon() {
      if (action == "end") return getIC("ic_end.png");
      return getIC("ic_latest.png");
    }

    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: border),
        ),
        child: Center(
          child: ImageCustom(
            height: 14,
            width: 16,
            image: AssetImage(getIcon()),
          ),
        )
      ),
    );
  }
}