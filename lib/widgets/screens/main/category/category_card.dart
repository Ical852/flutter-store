import 'package:flutter/material.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/models/category_model.dart';
import 'package:flutterstore/screens/edit_pages/category/edit_category_page.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/shared/text_styles.dart';
import 'package:flutterstore/widgets/buttons/mini_button_custom.dart';
import 'package:flutterstore/widgets/image_custom.dart';

// ignore: must_be_immutable
class CategoryCard extends StatelessWidget {
  Function(CategoryModel) onDelete;
  CategoryModel category;

  CategoryCard({
    super.key,
    required this.category,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      height: 70,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [getBoxShadow(2)],
      ),
      child: Row(
        children: [
          Text(
            capitalize(category.name),
            style: medium.black1S.mediumF,
          ),
          Spacer(),
          Row(
            children: [
              GestureDetector(
                onTap: () => onDelete(category),
                child: ImageCustom(
                  height: 34,
                  width: 34,
                  image: AssetImage(getIC("ic_delete.png")),
                ),
              ),
              SizedBox(width: 12),
              MiniButtonCustom(
                width: 120,
                height: 34,
                title: "Update",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditCategoryPage(category),
                    ),
                  );
                }
              ),
            ],
          ),
        ],
      ),
    );
  }
}
