import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstore/blocs/cubits/product_cubit.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/models/product_model.dart';

class AddProductViewModel {
  late BuildContext context;

  AddProductViewModel(BuildContext context) {
    this.context = context;
  }

  void createProduct(ProductModel product) {
    try {
      context.read<ProductCubit>().submitProduct(product);
      showGLobalAlert("success", "Success to create new product", context);
      context.read<ProductCubit>().resetPagination();
      Navigator.pushNamedAndRemoveUntil(context, "/main", (route) => false);
    } catch (e) {
      showGLobalAlert("danger", "Failed to create new product", context);
    }
  }
}
