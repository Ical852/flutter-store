import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstore/blocs/cubits/product_cubit.dart';
import 'package:flutterstore/functions/global_func.dart';

class DetailViewModel {
  late BuildContext context;

  DetailViewModel(BuildContext context) {
    this.context = context;
  }

  void deleteProduct(String id) {
    try {
      context.read<ProductCubit>().deleteProduct(id);
      showGLobalAlert("success", "Success to delete product", context);
      Navigator.pushNamedAndRemoveUntil(context, "/main", (route) => false);
    } catch (e) {
      showGLobalAlert("danger", "Failed to delete product", context);
    }
  }
}
