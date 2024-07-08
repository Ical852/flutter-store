import 'package:flutter/material.dart';
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
    required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    String getIcon() {
      if (icon == 'home') {
        return active ? 'ic_home_active.png' : 'ic_home.png';
      } else if (icon == 'category') {
        return active ? 'ic_category_active.png' : 'ic_category.png';
      } else {
        return active ? 'ic_home_active.png' : 'ic_home.png';
      }
    }

    ImageProvider GeneratedIcon() {
      return AssetImage('assets/icons/' + getIcon());
    }

    String getMenuTitle() {
      if (icon == 'home') {
        return 'Home';
      } else if (icon == 'category') {
        return 'Category';
      } else {
        return 'Home';
      }
    }

    Text GeneratedText() {
      return Text(
        getMenuTitle(),
        style: regular.copyWith(
          fontWeight: active ? fontSemiBold : fontRegular,
          color: active ? green1 : green3
        ),
      );
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
              image: GeneratedIcon(),
            ),
            GeneratedText()
          ],
        ),
      ),
    );
  }
}
