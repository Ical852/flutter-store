import 'package:flutterstore/models/product_model.dart';

class ResultProductsModel {
  late List<PageNProduct> products;
  late List<dynamic> pages;

  ResultProductsModel.init() {
    this.products = [];
    this.pages = [];
  }

  ResultProductsModel(List<PageNProduct> products, List<dynamic> pages) {
    this.products = products;
    this.pages = pages;
  }

  Map<String, dynamic> toJson() {
    return {
      "products": this.products.map((product) => product.toJson()).toList(),
      "pages": this.pages.map((page) => page).toList(),
    };
  }
}

class PageNProduct {
  late ProductModel product;
  late int pageNo;

  PageNProduct(ProductModel product, int pageNo) {
    this.product = product;
    this.pageNo = pageNo;
  }

  Map<String, dynamic> toJson() {
    return {
      "pageNo": this.pageNo,
      "product": this.product,
    };
  }
}