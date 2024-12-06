import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterstore/models/category_bloc_model.dart';
import 'package:flutterstore/models/category_model.dart';
import 'package:flutterstore/models/product_bloc_model.dart';
import 'package:flutterstore/models/product_model.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/shared/dummies.dart';
import 'package:flutterstore/shared/text_styles.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart' as intl;
import 'package:image_picker/image_picker.dart';

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
    orElse: () => CategoryModel.init(),
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
    orElse: () => ProductModel.init(),
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

String getIC(String icon) {
  return "assets/icons/$icon";
}

String getIL(String illustration) {
  return "assets/illustrations/$illustration";
}

String getIM(String image) {
  return "assets/images/$image";
}

Future<File?> pickImage(ImageSource source) async {
  try {
    XFile? image = await ImagePicker().pickImage(source: source);
    if (image == null) {
      return null;
    }
    File img = File(image.path);
    return img;
  } catch (e) {
    return null;
  }
}

void goToPage(BuildContext context, Widget route) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => route,
    ),
  );
}

void goToPageStr(BuildContext context, String route) {
  Navigator.pushNamed(context, route);
}

void navReplace(BuildContext context, Widget route) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(
      builder: (context) => route,
    ),
    (route) => false,
  );
}

void navReplaceStr(BuildContext context, String route) {
  Navigator.pushNamedAndRemoveUntil(
    context,
    route,
    (route) => false,
  );
}

BoxShadow getBoxShadow(double show) {
  return BoxShadow(
    color: blackColor.withOpacity(show / 10),
    blurRadius: show,
    offset: Offset(0, show),
  );
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
        top: Radius.circular(8),
      ),
    ),
  ));
}

void showDrawer(BuildContext context, double height, Widget content) {
  showModalBottomSheet<void>(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        height: height,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32), 
            topRight: Radius.circular(32),
          ),
        ),
        child: content,
      );
    },
  );
}

void showConfirm(BuildContext context, String confirm, Function onYes, onCancel) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirm'),
        content: Text(confirm),
        actions: <Widget>[
          TextButton(
            child: Text('No'),
            onPressed: () {
              onCancel();
              Navigator.of(context).pop(false);
            },
          ),
          TextButton(
            child: Text('Yes'),
            onPressed: () => onYes(),
          ),
        ],
      );
    },
  );
}

CategoryBlocModel generateCategory() {
  List<String> categoryNames = [
    "Shirt",
    "Pants",
    "Jacket",
    "Sweater",
    "Hat",
    "Boxers",
    "Underwear",
    "Outer",
    "Inner",
    "Shoes"
  ];
  List<CategoryModel> categories = List.generate(categoryNames.length, (index) {
    return CategoryModel("${categoryNames[index]}-$index", categoryNames[index]);
  });

  var categoryBloc = CategoryBlocModel.init();
  categoryBloc.categories = categories;

  return categoryBloc;
}

CategoryModel getDefaultCategory() {
  return CategoryModel("1234567890", "All Products");
}

List<ProductModel> generateProducts(List<ProductModel> uniques) {
  Random random = Random();
  String generateRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    return List.generate(
      length, (index) => chars[random.nextInt(chars.length)]
    ).join();
  }

  var categories = generateCategory().categories;

  List<ProductModel> products = List.generate(100, (index) {
    int categoryIndex = random.nextInt(categories.length);
    CategoryModel category = categories[categoryIndex];

    return ProductModel(
      random.nextInt(1000) + 1,
      random.nextInt(1000) + 1,
      random.nextInt(1000) + 1,
      random.nextInt(1000) + 1,
      random.nextInt(1000000) + 100,
      category,
      "",
      generateRandomString(24),
      generateRandomString(64),
      generateRandomString(100),
      imgDummies[index],
    );
  });

  for (ProductModel product in products) {
    product.id = generateProductId([...products, ...uniques]);
  }

  return products;
}

ProductBlocModel generateDummy() {
  var products1 = generateProducts([]);
  var products2 = generateProducts(products1);
  var products3 = generateProducts([...products1, ...products2]);

  var productBloc = ProductBlocModel.init();
  productBloc.pagination.products = [...products1, ...products2, ...products3];

  return productBloc;
}
