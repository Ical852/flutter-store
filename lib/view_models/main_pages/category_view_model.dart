import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstore/blocs/cubits/category_cubit.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/models/category_model.dart';

class CategoryViewModel {
  late BuildContext context;

  CategoryViewModel(BuildContext context) {
    this.context = context;
  }

  void filterCategory(String name) {
    try {
      context.read<CategoryCubit>().filter(name);
    } catch (e) {
      showGLobalAlert("danger", "Failed to search category", context);
    }
  }

  void deleteCategory(CategoryModel category) {
    try {
      context.read<CategoryCubit>().deleteCategory(category.id);
      showGLobalAlert("success", "Success to delete category", context);
    } catch (e) {
      showGLobalAlert("danger", "Failed to delete category", context);
    }
  }
}
