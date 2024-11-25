import 'package:flutter/material.dart';
import 'package:flutterstore/models/category_model.dart';
import 'package:flutterstore/view_models/edit_pages/edit_category_view_model.dart';
import 'package:flutterstore/widgets/buttons/main_button_custom.dart';
import 'package:flutterstore/widgets/header.dart';
import 'package:flutterstore/widgets/text_inputs/main_input_custom.dart';
import '../../../../shared/constants.dart';

// ignore: must_be_immutable
class EditCategoryPage extends StatefulWidget {
  CategoryModel category;
  EditCategoryPage(this.category);

  @override
  State<EditCategoryPage> createState() => _EditCategoryPageState();
}

class _EditCategoryPageState extends State<EditCategoryPage> {
  TextEditingController categoryNameController = TextEditingController(text: "");
  late var editCategoryVM = EditCategoryViewModel(context);
  bool isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    categoryNameController.text = this.widget.category.name;
    categoryNameController.addListener(_validateInput);
  }

  @override
  void dispose() {
    categoryNameController.removeListener(_validateInput);
    categoryNameController.dispose();
    super.dispose();
  }

  void _validateInput() => setState(() => isButtonDisabled = categoryNameController.text.isEmpty);

  @override
  Widget build(BuildContext context) {
    void updateCategory() {
      var category = CategoryModel(
        this.widget.category.id,
        categoryNameController.text,
      );
      editCategoryVM.updateCategory(category);
    }

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
                          Header(title: "Edit Category"),
                          SizedBox(height: 32),
                          MainInputCustom(
                            title: "Category Name",
                            hint: "Input category name",
                            controller: categoryNameController,
                          ),
                          SizedBox(height: 20),
                          MainButtonCustom(
                            title: 'Update Category',
                            onPressed: () => setState(() => updateCategory()),
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
