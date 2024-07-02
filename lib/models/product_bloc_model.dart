import 'package:flutterstore/models/pagination_model.dart';
import 'package:flutterstore/models/result_products_model.dart';

class ProductBlocModel {
  late PaginationModel pagination;
  late ResultProductsModel resultProduct;

  ProductBlocModel.init() {
    this.pagination = PaginationModel.init();
    this.resultProduct = ResultProductsModel.init();
  }

  ProductBlocModel(PaginationModel pagination, ResultProductsModel resultProduct) {
    this.pagination = pagination;
    this.resultProduct = resultProduct;
  }

  Map<String, dynamic> toJson() {
    return {
      "pagination": this.pagination.toJson(),
      "result_product": this.resultProduct.toJson(),
    };
  }
}