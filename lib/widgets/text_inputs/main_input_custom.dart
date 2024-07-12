import 'package:flutter/material.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/shared/text_styles.dart';

// ignore: must_be_immutable
class MainInputCustom extends StatelessWidget {
  String title, hint;
  bool password, enabled;
  TextEditingController controller;
  TextInputType inputType;
  Function(String)? onChanged;

  MainInputCustom({
    required this.title,
    required this.hint,
    this.password = false,
    required this.controller,
    this.inputType = TextInputType.text,
    this.onChanged,
    this.enabled = true
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: regular.black.regularF,
          ),
          SizedBox(height: 6),
          Opacity(
            opacity: enabled ? 1 : 0.7,
            child: TextFormField(
              enabled: enabled,
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
                  borderRadius: BorderRadius.circular(8)
                ),
                contentPadding: EdgeInsets.only(
                  top: 13,
                  bottom: 13,
                  left: 21,
                  right: 21
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: green1
                  ),
                  borderRadius: BorderRadius.circular(8)
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
