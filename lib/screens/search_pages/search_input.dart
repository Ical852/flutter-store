import 'package:flutter/material.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/shared/text_styles.dart';
import 'package:flutterstore/widgets/image_custom.dart';

// ignore: must_be_immutable
class SearchInput extends StatelessWidget {
  TextEditingController searchController;
  Function() onBack;
  Function(String) onFieldSubmitted;

  SearchInput({
    super.key,
    required this.onBack,
    required this.searchController,
    required this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82,
      width: double.infinity,
      color: green1,
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBack,
            child: Container(
              height: 45,
              width: 45,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: whiteColor
              ),
              child: Center(
                child: ImageCustom(
                  height: 24,
                  width: 24,
                  image: AssetImage(getIC("ic_back.png")),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: whiteColor
              ),
              child: Stack(
                children: [
                  TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      labelText: "Search movie or tv here",
                      labelStyle: regular.grey1S.regularF,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(right: 52, left: 16)
                    ),
                    onFieldSubmitted: onFieldSubmitted,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ImageCustom(
                      margin: EdgeInsets.only(right: 16),
                      width: 24,
                      height: 24,
                      image: AssetImage(getIC("ic_search.png")),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}