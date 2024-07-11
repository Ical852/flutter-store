import 'package:flutter/material.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/models/category_bloc_model.dart';
import 'package:flutterstore/models/category_model.dart';
import 'package:flutterstore/widgets/buttons/mini_button_custom.dart';
import 'package:flutterstore/widgets/drawer_title_desc.dart';
import 'package:flutterstore/widgets/image_custom.dart';
import 'package:flutterstore/widgets/screens/add/category_input_item.dart';

// ignore: must_be_immutable
class CategoryDrawer extends StatelessWidget {
  Function(CategoryModel, Function) setCategory;
  Function(CategoryModel) isCategoryActive;
  CategoryBlocModel state;

  CategoryDrawer({
    super.key,
    required this.state,
    required this.setCategory,
    required this.isCategoryActive
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((BuildContext context, StateSetter setState) {
      if (state.categories.length < 1) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: DrawerTitleDesc(
                title: 'No Categories',
                desc: 'It looks like you havent created any categories yet. Create category first to create your product..',
              ),
            ),
            ImageCustom(
              height: 150,
              width: 150,
              image: AssetImage(getIL("il_no_categories.png")),
            ),
            MiniButtonCustom(
              title: "Create Category",
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, "/add-category", (route) => false);
              }
            )
          ],
        );
      }

      return Container(
        child: ListView(
          padding: EdgeInsets.only(bottom: 70),
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: DrawerTitleDesc(
                title: 'Choose Category',
                desc: 'Choose your product category depending on the category you created.',
              ),
            ),
            Column(
              children: state.categories.map((cat) {
                return CategoryInputItem(
                  title: cat.name,
                  onPress: () {
                    setCategory(cat, setState);
                  },
                  active: isCategoryActive(cat),
                );
              }).toList(),
            )
          ],
        ),
      );
    }));
  }
}
