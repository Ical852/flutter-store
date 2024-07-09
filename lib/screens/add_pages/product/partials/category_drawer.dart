import 'package:flutter/material.dart';
import 'package:flutterstore/models/category_bloc_model.dart';
import 'package:flutterstore/models/category_model.dart';
import 'package:flutterstore/widgets/drawer_title_desc.dart';
import 'package:flutterstore/widgets/screens/add/category_input_item.dart';

// ignore: must_be_immutable
class CategoryDrawer extends StatelessWidget {
  Function(CategoryModel, Function) setCategory;
  Function(CategoryModel) isCategoryActive;
  CategoryBlocModel state;
  CategoryDrawer(
      {super.key,
      required this.state,
      required this.setCategory,
      required this.isCategoryActive});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: ((BuildContext context, StateSetter setState) {
      return Container(
        child: ListView(
          padding: EdgeInsets.only(bottom: 70),
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: DrawerTitleDesc(
                title: 'Choose Category',
                desc:
                    'Choose your product category depending on the category you created.',
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
