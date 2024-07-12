import 'package:flutter/material.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/models/product_model.dart';
import 'package:flutterstore/screens/detail_pages/partials/bottom_action.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/shared/text_styles.dart';
import 'package:flutterstore/view_models/detail_pages/detail_view_model.dart';
import 'package:flutterstore/widgets/badge_custom.dart';
import 'package:flutterstore/widgets/buttons/circle_button.dart';
import 'package:flutterstore/widgets/header.dart';
import 'package:flutterstore/widgets/image_custom.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  ProductModel product;
  DetailPage(this.product);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late DetailViewModel detailVM = DetailViewModel(context);

  @override
  Widget build(BuildContext context) {
    var product = this.widget.product;

    Widget BottomActionContent() {
      return BottomAction(product: product);
    }

    Widget MainContent(context) {
      return Container(
        margin: EdgeInsets.only(left: 24, right: 24, top: 81),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageCustom(
                width: double.infinity,
                height: 245,
                image: NetworkImage(widget.product.image),
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(12),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.name,
                          style: base.black1S.semiBold,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 3),
                        BadgeCustom(title: product.category.name)
                      ],
                    ),
                  ),
                  SizedBox(width: 12),
                  CircleButton(onPressed: () {
                    showConfirm(
                      context,
                      "Are you sure wnat to delete this product?",
                      (){
                        detailVM.deleteProduct(product.id, context);
                      },
                      (){}
                    );
                  })
                ],
              ),
              SizedBox(height: 24,),
              Text(
                "Description",
                style: regular.black1S.mediumF,
              ),
              SizedBox(height: 8,),
              Text(
                product.desc,
                style: regular.grey1S.light,
              ),
              SizedBox(height: 20,),
              Text(
                "Width | Height | Length | Weight",
                style: regular.black1S.mediumF,
              ),
              SizedBox(height: 8,),
              Text(
                "${product.width.toString()}cm | ${product.height.toString()}cm | ${product.length.toString()}cm | ${product.weight.toString()}kg",
                style: regular.grey1S.light,
              ),
              SizedBox(height: 20,),
              Text(
                "Sku",
                style: regular.black1S.mediumF,
              ),
              SizedBox(height: 8,),
              Text(
                "${product.sku}",
                style: regular.grey1S.light,
              ),
              SizedBox(height: 172),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32
                ),
                child: Header(title: "Product Detail")
              ),
              MainContent(context),
              BottomActionContent(),
            ],
          ),
        ),
      ),
    );
  }
}
