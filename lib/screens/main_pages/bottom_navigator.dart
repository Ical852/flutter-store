import 'package:flutter/material.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/shared/text_styles.dart';
import 'package:flutterstore/widgets/image_custom.dart';
import 'package:flutterstore/widgets/menu_item.dart';

// ignore: must_be_immutable
class BottomNavigator extends StatelessWidget {
  Function(String) onPress;
  Function() onUp;
  String currentPage;

  BottomNavigator({
    super.key,
    required this.onPress,
    required this.currentPage,
    required this.onUp,
  });

  @override
  Widget build(BuildContext context) {
    Widget CreateButton() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: LinearGradient(
              colors: [green2, green1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ),
          width: 80,
          height: 80,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)
              )
            ),
            onPressed: onUp,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageCustom(
                  height: 42,
                  width: 35,
                  image: AssetImage('assets/icons/ic_up.png'),
                  margin: EdgeInsets.only(bottom: 4),
                ),
                Text('Up', style: regular.white.semiBold),
              ],
            ),
          ),
        ),
      );
    }

    Widget MenuItems() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                color: blackColor.withOpacity(0.9),
                blurRadius: 9,
                offset: Offset(0, 9)
              )
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MenuItemCustom(
                icon: 'home',
                onPress: () => onPress('home'),
                active: currentPage == 'home',
              ),
              Container(width: 80),
              MenuItemCustom(
                icon: 'category',
                onPress: () => onPress('category'),
                active: currentPage == 'category',
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: 88,
      child: Stack(
        children: [
          MenuItems(),
          CreateButton(),
        ],
      ),
    );
  }
}
