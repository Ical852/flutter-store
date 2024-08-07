import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/models/category_model.dart';

class CategoryBlocModel {
  late CategoryModel current;
  late List<CategoryModel> categories;
  late List<CategoryModel> filtered;

  CategoryBlocModel.init() {
    this.current = getDefaultCategory();
    this.categories = [];
    this.filtered = [];
  }
}
