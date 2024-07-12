import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstore/blocs/cubits/category_cubit.dart';
import 'package:flutterstore/models/category_bloc_model.dart';
import 'package:flutterstore/models/category_model.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/shared/text_styles.dart';
import 'package:flutterstore/widgets/image_custom.dart';

// ignore: must_be_immutable
class CategoryInput extends StatelessWidget {
  CategoryModel category;
  Function(CategoryBlocModel) showCategoryDrawer;

  CategoryInput({
    super.key,
    required this.category,
    required this.showCategoryDrawer
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryBlocModel>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Product Category',
                style: regular.black.regularF
              ),
              GestureDetector(
                onTap: () => showCategoryDrawer(state),
                child: Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 6),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: green3),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        category.name,
                        style: medium.black.regularF
                      ),
                      ImageCustom(
                        height: 8,
                        width: 16,
                        image: AssetImage('assets/icons/ic_down.png'),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}