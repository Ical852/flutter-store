import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstore/blocs/cubits/category_cubit.dart';
import 'package:flutterstore/models/category_bloc_model.dart';
import 'package:flutterstore/models/category_model.dart';
import 'package:flutterstore/widgets/category_item.dart';

// ignore: must_be_immutable
class CategoryList extends StatelessWidget {
  Function() onAllProducts;
  Function(CategoryModel) onChoose;

  CategoryList({
    super.key,
    required this.onAllProducts,
    required this.onChoose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: BlocConsumer<CategoryCubit, CategoryBlocModel>(
          listener: (context, state) {},
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 24),
                CategoryItem(
                  title: "All Products",
                  current: state.current.name,
                  onPress: onAllProducts,
                ),
                Row(
                  children: state.categories.map((category) {
                    return CategoryItem(
                      title: category.name,
                      current: state.current.name,
                      onPress: () => onChoose(category),
                    );
                  }).toList(),
                ),
                SizedBox(width: 8),
              ],
            );
          },
        ),
      ),
    );
  }
}