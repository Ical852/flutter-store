import 'package:flutter/material.dart';
import 'package:flutterstore/screens/main_pages/bottom_navigator.dart';
import 'package:flutterstore/screens/main_pages/tabs/category/category_tab.dart';
import 'package:flutterstore/screens/main_pages/tabs/home/home_tab.dart';
import 'package:flutterstore/shared/constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var currentPage = "home";

  @override
  Widget build(BuildContext context) {
    Widget ContentRender() {
      if (currentPage == "category") return CategoryTab();
      return HomeTab();
    }

    Widget BottomNavRender() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: BottomNavigator(
          currentPage: currentPage,
          onPress: (set) {
            setState(() {
              currentPage = set;
            });
          },
          onUp: () {},
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: whiteColor,
          child: Stack(
            children: [
              ContentRender(),
              BottomNavRender()
            ],
          ),
        ),
      ),
    );
  }
}
