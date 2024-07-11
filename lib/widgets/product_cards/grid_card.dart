import 'package:flutter/material.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/models/product_model.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/shared/text_styles.dart';
import 'package:flutterstore/widgets/badge_custom.dart';
import 'package:flutterstore/widgets/image_custom.dart';

// ignore: must_be_immutable
class GridCard extends StatelessWidget {
  Function() onPress;
  ProductModel product;

  GridCard({
    super.key,
    required this.product,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: whiteColor,
          boxShadow: [getBoxShadow(2.5)],
          borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            ImageCustom(
              margin: EdgeInsets.only(bottom: 10),
              width: (getWH(context, "width") * 0.5) - 51,
              height: (getWH(context, "width") * 0.5) - 51,
              fit: BoxFit.cover,
              image: NetworkImage(product.image),
            ),
            BadgeCustom(title: product.category.name),
            SizedBox(height: 5,),
            Text(
              product.name,
              style: small.black1S.semiBold,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Spacer(),
            Text(
              moneyFormat(product.price),
              style: regular.primary.semiBold,
            )
          ],
        ),
      ),
    );
  }
}