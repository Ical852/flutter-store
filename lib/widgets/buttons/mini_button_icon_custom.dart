import 'package:flutter/material.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/shared/text_styles.dart';

// ignore: must_be_immutable
class MiniButtonIconCustom extends StatelessWidget {
  String title;
  Function() onPress;
  IconData icon;

  MiniButtonIconCustom({
    required this.title,
    required this.onPress, 
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: green1
      ),
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent.withOpacity(0.1),
        ),
        onPressed: onPress,
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 8),
            Text(
              title,
              style: regular.white.mediumF
            ),
          ],
        ),
      ),
    );
  }
}
