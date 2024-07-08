import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstore/blocs/cubits/category_cubit.dart';
import 'package:flutterstore/blocs/cubits/product_cubit.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/models/category_model.dart';

class HomeViewModel {
  late BuildContext context;

  HomeViewModel(BuildContext context) {
    this.context = context;
    refreshProducts();
  }

  void refreshProducts() {
    context.read<ProductCubit>().refreshProducts();
  }

  void setCategory(CategoryModel category) {
    try {
      context.read<CategoryCubit>().setCurrent(category);
      context.read<ProductCubit>().changeCategory(category);
      refreshProducts();
    } catch (e) {
      showGLobalAlert("danger", "Failed to set new category", context);
    }
  }

  void setLimit(int limit) {
    try {
      context.read<ProductCubit>().changeLimit(limit);
      Navigator.pop(context);
      refreshProducts();
    } catch (e) {
      showGLobalAlert("danger", "Failed to set new pagination limit", context);
    }
  }
}
