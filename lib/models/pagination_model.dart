import 'package:flutterstore/models/product_model.dart';

class PaginationModel {
  late int page, limit;
  late String filter;
  late List<ProductModel> products;

  PaginationModel(int page, limit, String filter, List<ProductModel> products) {
    this.page = page;
    this.limit = limit;
    this.filter = filter;
    this.products = products;
  }

  PaginationModel.init() {
    this.page = 0;
    this.limit = 10;
    this.filter = "";
    this.products = [];
  }

  Map<String, dynamic> toJson() {
    return {
      "page": this.page,
      "limit": this.limit,
      "filter": this.filter,
      "products": this.products.map((product) => product.toJson()).toList(),
    };
  }
}