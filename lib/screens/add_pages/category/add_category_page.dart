import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstore/blocs/cubits/category_cubit.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/models/category_model.dart';
import 'package:flutterstore/view_models/add_pages/add_category_view_model.dart';
import 'package:flutterstore/widgets/buttons/main_button_custom.dart';
import 'package:flutterstore/widgets/header.dart';
import 'package:flutterstore/widgets/text_inputs/main_input_custom.dart';
import '../../../shared/constants.dart';

class AddCategoryPage extends StatefulWidget {
  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  TextEditingController categoryNameController = TextEditingController(text: "");
  late AddCategoryViewModel addCategoryVM = AddCategoryViewModel(context);
  bool isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    categoryNameController.addListener(_validateInput);
  }

  @override
  void dispose() {
    categoryNameController.removeListener(_validateInput);
    categoryNameController.dispose();
    super.dispose();
  }

  void _validateInput() => setState(() => isButtonDisabled = categoryNameController.text.isEmpty);

  void createCategory() {
    var categories = context.read<CategoryCubit>().state.categories;
    var category = CategoryModel(
      generateCategoryId(categories),
      categoryNameController.text
    );
    addCategoryVM.createCategory(category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 24, right: 24),
                      child: ListView(
                        children: [
                          SizedBox(height: 30),
                          Header(title: "Create Category"),
                          SizedBox(height: 32),
                          MainInputCustom(
                            title: "Category Name",
                            hint: "Input category name",
                            controller: categoryNameController,
                          ),
                          SizedBox(height: 20),
                          MainButtonCustom(
                            title: 'Create Category',
                            onPressed: () => setState(() => createCategory()),
                            disabled: isButtonDisabled,
                          ),
                          SizedBox(height: 120),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
