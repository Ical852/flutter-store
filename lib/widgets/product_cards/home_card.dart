import 'package:flutter/material.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/models/product_model.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/shared/text_styles.dart';
import 'package:flutterstore/widgets/badge_custom.dart';
import 'package:flutterstore/widgets/image_custom.dart';

// ignore: must_be_immutable
class HomeCard extends StatelessWidget {
  ProductModel product;
  Function() onPress;
  HomeCard({
    super.key,
    required this.product,
    required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 150,
        margin: EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 20
        ),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [getBoxShadow(2)]
        ),
        child: Row(
          children: [
            ImageCustom(
              height: 118,
              width: 118,
              image: NetworkImage(product.image),
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(8),
            ),
            SizedBox(width: 16,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BadgeCustom(title: product.category.name),
                  SizedBox(height: 8,),
                  Text(
                    product.name,
                    style: regular.black1S.semiBold,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: 8,),
                  Text(
                    product.desc,
                    style: small.grey1S.regularF,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        moneyFormat(product.price),
                        style: regular.primary.semiBold,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 20
                        ),
                        decoration: BoxDecoration(
                          color: green1,
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: Text(
                          "Buy",
                          style: small.white.regularF,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}