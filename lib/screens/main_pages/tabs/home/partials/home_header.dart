import 'package:flutter/material.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/screens/search_pages/search_page.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/shared/text_styles.dart';
import 'package:flutterstore/widgets/image_custom.dart';

// ignore: must_be_immutable
class HomeHeader extends StatelessWidget {
  Function() onSearch;
  HomeHeader({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    Widget RenderTitleHead() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Hello\nUser Klontong",
            style: extra.white.semiBold,
          ),
          Container(
            width: 60,
            height: 60,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(50)
            ),
            child: ImageCustom(
              height: 50,
              width: 50,
              image: AssetImage(getIM("im_user.png")),
            ),
          )
        ],
      );
    }

    Widget RenderSearchBar() {
      return GestureDetector(
        onTap: () {
          onSearch();
          navReplace(context, SearchPage());
        },
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [getBoxShadow(2)],
          ),
          child: Container(
            child: Row(
              children: [
                ImageCustom(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  height: 20,
                  width: 20,
                  image: AssetImage(getIC("ic_search.png")),
                ),
                Text(
                  "Search your products here...",
                  style: regular.regularF.copyWith(color: black1.withOpacity(0.4)),
                )
              ],
            ),
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: 172,
      decoration: BoxDecoration(
        color: green1,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12)
        )
      ),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            RenderTitleHead(),
            Spacer(),
            RenderSearchBar(),
          ],
        ),
      ),
    );
  }
}
