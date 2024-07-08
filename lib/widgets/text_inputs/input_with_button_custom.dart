import 'package:flutter/material.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/shared/text_styles.dart';

// ignore: must_be_immutable
class InputWithButtonCustom extends StatelessWidget {
  String title, hint;
  bool password;
  TextEditingController controller;
  TextInputType inputType;
  Widget iconContent;
  Function() onPress;
  Function(String)? onChanged;

  InputWithButtonCustom(
      {required this.title,
      required this.hint,
      this.password = false,
      required this.controller,
      this.inputType = TextInputType.text,
      required this.iconContent,
      required this.onPress,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: regular.black.regularF),
          SizedBox(
            height: 6,
          ),
          Container(
            height: 50,
            child: Stack(children: [
              TextFormField(
                onChanged: onChanged,
                keyboardType: inputType,
                controller: controller,
                obscureText: password,
                style: medium.black.regularF,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: medium.green3S.regularF,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: green3),
                      borderRadius: BorderRadius.circular(8)),
                  contentPadding:
                      EdgeInsets.only(top: 13, bottom: 13, left: 21, right: 56),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: green1),
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              GestureDetector(
                onTap: onPress,
                child: Container(
                  margin: EdgeInsets.only(right: 18),
                  height: double.infinity,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: iconContent,
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
