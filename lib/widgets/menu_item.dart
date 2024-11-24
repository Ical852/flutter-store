import 'package:flutter/material.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/shared/text_styles.dart';
import 'package:flutterstore/widgets/image_custom.dart';

// ignore: must_be_immutable
class MenuItemCustom extends StatelessWidget {
  String icon;
  bool active;
  Function() onPress;

  MenuItemCustom({
    required this.icon,
    this.active = false,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    String getIcon() {
      if (icon == 'category') {
        return active ? 'ic_category_active.png' : 'ic_category.png';
      }
      return active ? 'ic_home_active.png' : 'ic_home.png';
    }

    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageCustom(
              width: 24,
              height: 24,
              image: AssetImage('assets/icons/' + getIcon()),
            ),
            Text(
              capitalize(icon),
              style: regular.copyWith(
                fontWeight: active ? fontSemiBold : fontRegular,
                color: active ? green1 : green3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
