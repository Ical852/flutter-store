import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterstore/models/pagination_model.dart';
import 'package:flutterstore/models/product_model.dart';
import 'package:flutterstore/models/result_products_model.dart';

part '../states/product_state.dart';

class ProductCubit extends Cubit<PaginationModel> {
  ProductCubit() : super(PaginationModel.init());

  bool submitFilter(String filter) {
    try {
      var newState = state;
      newState.filter = filter;
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool changePage(int page) {
    try {
      var newState = state;
      newState.page = page;
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool changeLimit(int limit) {
    try {
      var newState = state;
      newState.limit = limit;
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool submitProduct(ProductModel product) {
    try {
      var newState = state;
      newState.products.add(product);
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool editProduct(ProductModel product, String id) {
    try {
      var newState = state;
      int index = newState.products.indexWhere((product) => product.id == id);

      if (index != -1) {
        newState.products[index] = product;
        emit(newState);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  bool deleteProduct(String id) {
    try {
      var newState = state;
      newState.products.removeWhere((product) => product.id == id);
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  ResultProductsModel? getProducts() {
    try {
      var limit = state.limit;
      var page = state.page;
      var filter = state.filter;
      var products = state.products;

      if (filter.isNotEmpty) {
        products =
            products.where((product) => product.name.contains(filter)).toList();
      }

      List<int> pages = [];
      for (int i = 1; i <= (products.length / limit).round(); i++) {
        pages.add(i);
      }

      List<PageNProduct> resProducts = [];
      var start = (page - 1) * limit;
      var last = (page * limit) - 1;

      for (int i = 0; i < products.length; i++) {
        if (i >= start && i <= last) {
          if (products[i].id.isNotEmpty) {
            resProducts.add(PageNProduct(products[i], i + 1));
          }
        }
      }

      return ResultProductsModel(resProducts, pages);
    } catch (e) {
      return null;
    }
  }
}
