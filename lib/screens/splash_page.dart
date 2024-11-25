import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/shared/text_styles.dart';
import 'package:flutterstore/widgets/image_custom.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () => navReplaceStr(context, "/main"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: green1,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageCustom(
                  height: 107,
                  width: 120,
                  image: AssetImage(getIM("im_logo.png")),
                ),
                SizedBox(height: 16),
                Text(
                  "Klontong",
                  style: mass.white.semiBold,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
