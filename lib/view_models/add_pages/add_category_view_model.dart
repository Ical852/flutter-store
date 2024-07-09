import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstore/blocs/cubits/category_cubit.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/models/category_model.dart';

class AddCategoryViewModel {
  late BuildContext context;

  AddCategoryViewModel(BuildContext context) {
    this.context = context;
  }

  void createCategory(CategoryModel category) {
    try {
      context.read<CategoryCubit>().submitCategory(category);
      showGLobalAlert("success", "Success to create new category", context);
      Navigator.pushNamedAndRemoveUntil(context, "/main", (route) => false);
    } catch (e) {
      showGLobalAlert("danger", "Failed to create new category", context);
    }
  }
}
