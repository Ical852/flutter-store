import 'package:flutter/material.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/shared/text_styles.dart';
import 'package:flutterstore/widgets/buttons/mini_button_custom.dart';
import 'package:flutterstore/widgets/image_custom.dart';

// ignore: must_be_immutable
class EmptyProducts extends StatelessWidget {
  String desc;
  bool noBtn;

  EmptyProducts({
    super.key,
    this.desc = "",
    this.noBtn = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ImageCustom(
            height: 250,
            width: 250,
            image: AssetImage(getIL("il_no_products.png")),
            fit: BoxFit.cover,
          ),
          Text(
            "Ups, Empty",
            style: mega.black1S.semiBold,
          ),
          SizedBox(height: 6,),
          Container(
            width: 270,
            child: Text(
              desc != "" ? desc : "Seems like you haven’t published any products yet, go publish some product",
              textAlign: TextAlign.center,
              style: regular.grey1S.light,
            ),
          ),
          SizedBox(height: 24,),
          !noBtn ? MiniButtonCustom(
            title: "Create Product",
            onPressed: () => Navigator.pushNamed(context, "/add-product"),
          ) : SizedBox(),
          SizedBox(height: 172,),
        ],
      ),
    );
  }
}