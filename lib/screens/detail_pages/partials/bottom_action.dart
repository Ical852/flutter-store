import 'package:flutter/material.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/models/product_model.dart';
import 'package:flutterstore/screens/edit_pages/product/edit_product_page.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/shared/text_styles.dart';
import 'package:flutterstore/widgets/buttons/mini_button_custom.dart';

// ignore: must_be_immutable
class BottomAction extends StatelessWidget {
  ProductModel product;
  BottomAction({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: whiteColor,
          boxShadow: [getBoxShadow(9)]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              moneyFormat(product.price),
              style: mega.primary.semiBold,
            ),
            MiniButtonCustom(
              width: 165,
              height: 40,
              title: "Edit Product",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProductPage(product)
                  )
                );
              },
            )
          ],
        ),
      ),
    );
  }
}