import 'package:flutter/material.dart';
import 'package:flutterstore/models/category_model.dart';
import 'package:flutterstore/models/product_model.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/shared/text_styles.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart' as intl;

dynamic nullChecker(dynamic check) {
  if (check == null) return null;
  return check;
}

bool isNotNull(dynamic check) {
  return check != null;
}

Color getColorType(type) {
  if (type == 'danger') {
    return errorColor;
  } else if (type == 'info') {
    return infoColor;
  } else {
    return successColor;
  }
}

double getWH(BuildContext context, String type) {
  var size = MediaQuery.of(context).size;

  if (type == 'width') return size.width;
  return size.height;
}

String capitalize(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1);
}

String generateCategoryId(List<CategoryModel> categories) {
  var uuid = Uuid();
  var generated = uuid.v1();
  CategoryModel find = categories.firstWhere(
    (category) => category.id == generated,
    orElse: () => CategoryModel("", "")
  );

  if (find.id.isEmpty) {
    return generated;
  }
  return generateCategoryId(categories);
}

String generateProductId(List<ProductModel> products) {
  var uuid = Uuid();
  var generated = uuid.v1();
  ProductModel find = products.firstWhere(
    (product) => product.id == generated,
    orElse: () => ProductModel(
      0, 0, 0, 0,  CategoryModel("", ""), "", "", "", "", "", ""
    )
  );

  if (find.id.isEmpty) {
    return generated;
  }
  return generateProductId(products);
}

String rawMoneyFormat(int number) {
  var formatted = intl.NumberFormat.decimalPattern().format(number);

  return formatted.replaceAll(',', '.');
}

String moneyFormat(int number) {
  var formatted = intl.NumberFormat.decimalPattern().format(number);

  return 'IDR. ' + formatted.replaceAll(',', '.');
}

double screenWidthPercentage(context, double percentage) {
  return MediaQuery.of(context).size.width * percentage;
}

double screenHeightPercentage(context, double percentage) {
  return MediaQuery.of(context).size.height * percentage;
}

void showGLobalAlert(type, text, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: Duration(seconds: 2),
    content: Text(
      text,
      style: regular.white.bold,
      textAlign: TextAlign.center,
    ),
    backgroundColor: getColorType(type),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(8)
      )
    ),
  ));
}

void showDrawer(BuildContext context, double height, Widget content) {
  showModalBottomSheet<void>(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32), 
        topRight: Radius.circular(32)
      )
    ),
    builder: (BuildContext context) {
      return Container(
        height: height ,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32)
          )
        ),
        child: content,
      );
    },
  );
}