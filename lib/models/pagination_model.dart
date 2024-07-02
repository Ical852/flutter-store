import 'package:flutterstore/models/category_model.dart';
import 'package:flutterstore/models/product_model.dart';

class PaginationModel {
  late String filter;
  late int page, limit;
  late CategoryModel categoryFilter;
  late List<ProductModel> products;

  PaginationModel.init() {
    this.filter = "";
    this.page = 0;
    this.limit = 10;
    this.categoryFilter = CategoryModel.init();
    this.products = [];
  }

  PaginationModel(
    String filter,
    int page, limit,
    CategoryModel categoryFilter,
    List<ProductModel> products,
  ) {
    this.filter = filter;
    this.page = page;
    this.limit = limit;
    this.categoryFilter = categoryFilter;
    this.products = products;
  }

  Map<String, dynamic> toJson() {
    return {
      "page": this.page,
      "limit": this.limit,
      "filter": this.filter,
      "category_filter": this.categoryFilter.toJson(),
      "products": this.products.map((product) => product.toJson()).toList(),
    };
  }
}