import 'package:flutter/material.dart';
import 'package:flutterstore/models/category_model.dart';

// ignore: must_be_immutable
class EditCategoryPage extends StatefulWidget {
  CategoryModel category;
  EditCategoryPage(this.category);

  @override
  State<EditCategoryPage> createState() => _EditCategoryPageState();
}

class _EditCategoryPageState extends State<EditCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
