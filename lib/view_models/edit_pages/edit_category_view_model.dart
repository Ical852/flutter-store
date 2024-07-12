import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstore/blocs/cubits/category_cubit.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/models/category_model.dart';

class EditCategoryViewModel {
  late BuildContext context;

  EditCategoryViewModel(BuildContext context) {
    this.context = context;
  }

  void updateCategory(CategoryModel category) {
    try {
      context.read<CategoryCubit>().editCategory(category, category.id);
      showGLobalAlert("success", "Success to update category", context);
      context.read<CategoryCubit>().resetFilter();
      Navigator.pushNamedAndRemoveUntil(context, "/main", (route) => false);
    } catch (e) {
      showGLobalAlert("danger", "Failed to update category", context);
    }
  }
}
