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
  }

  void refreshProducts() {
    context.read<ProductCubit>().refreshProducts();
  }

  void resetPagination() {
    try {
      context.read<ProductCubit>().resetPagination();
      refreshProducts();
      setCategory(getDefaultCategory());
    } catch (e) {
      showGLobalAlert("danger", "Failed to reset pagination", context);
    }
  }

  void setCategory(CategoryModel category) {
    try {
      context.read<CategoryCubit>().setCurrent(category);
      context.read<ProductCubit>().changeCategory(category);
      setPage(1);
      refreshProducts();
    } catch (e) {
      showGLobalAlert("danger", "Failed to set new category", context);
    }
  }

  void setLimit(int limit) {
    try {
      context.read<ProductCubit>().changeLimit(limit);
      Navigator.pop(context);
      setPage(1);
      refreshProducts();
    } catch (e) {
      showGLobalAlert("danger", "Failed to set new pagination limit", context);
    }
  }

  void setPage(int page) {
    try {
      context.read<ProductCubit>().changePage(page);
      refreshProducts();
    } catch (e) {
      showGLobalAlert("danger", "Failed to set new page", context);
    }
  }
}
