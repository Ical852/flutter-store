import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstore/blocs/cubits/product_cubit.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/models/product_model.dart';

class EditProductViewModel {
  late BuildContext context;

  EditProductViewModel(BuildContext context) {
    this.context = context;
  }

  void updateProduct(ProductModel product) {
    try {
      context.read<ProductCubit>().editProduct(product, product.id);
      showGLobalAlert("success", "Success to update product", context);
      Navigator.pushNamedAndRemoveUntil(context, "/main", (route) => false);
    } catch (e) {
      showGLobalAlert("danger", "Failed to update product", context);
    }
  }
}
