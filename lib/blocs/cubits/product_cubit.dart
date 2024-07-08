import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/models/category_model.dart';
import 'package:flutterstore/models/product_bloc_model.dart';
import 'package:flutterstore/models/product_model.dart';
import 'package:flutterstore/models/result_products_model.dart';

part '../states/product_state.dart';

class ProductCubit extends Cubit<ProductBlocModel> {
  ProductCubit() : super(generateDummy());

  bool submitFilter(String filter) {
    try {
      var newState = state;
      newState.pagination.filter = filter;
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool changeCategory(CategoryModel category) {
    try {
      var newState = state;
      newState.pagination.categoryFilter = category;
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool changePage(int page) {
    try {
      var newState = state;
      newState.pagination.page = page;
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool changeLimit(int limit) {
    try {
      var newState = state;
      newState.pagination.limit = limit;
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool submitProduct(ProductModel product) {
    try {
      var newState = state;
      newState.pagination.products.insert(0, product);
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool editProduct(ProductModel product, String id) {
    try {
      var newState = state;
      int index = newState.pagination.products.indexWhere((product) => product.id == id);

      if (index != -1) {
        newState.pagination.products[index] = product;
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
      newState.pagination.products.removeWhere((product) => product.id == id);
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool refreshProducts() {
    try {
      var pagination = state.pagination;
      var newState = state;

      var limit = pagination.limit;
      var page = pagination.page;
      var filter = pagination.filter;
      var categoryFilter = pagination.categoryFilter;
      var products = pagination.products;

      if (
        categoryFilter.id.isNotEmpty &&
        categoryFilter.name != "All Products"
      ) {
        products = products
          .where((product) => product.category.id == categoryFilter.id)
          .toList();
      }

      if (filter.isNotEmpty) {
        products = products.where((product) => product.name.contains(filter)).toList();
      }

      List<dynamic> pages = [];
      for (int i = 1; i <= (products.length / limit).round(); i++) {
        pages.add(i);
      }
      newState.pagination.lastPage = pages[pages.length - 1];

      List<dynamic> formatPages = [];
      if (pages.length > 5) {
        if (page <= 2) {
          var set = [1, 2, 3, 4];
          formatPages.addAll(set);
          formatPages.add("...");
          pages = formatPages;
        } else if (page >= pages[pages.length - 2]) {
          var max = pages.length;
          var set = [max - 3, max - 2, max - 1, max];
          formatPages.add("...");
          formatPages.addAll(set);
          pages = formatPages;
        } else {
          var set = [page - 1, page, page + 1];
          formatPages.add("...");
          formatPages.addAll(set);
          formatPages.add("...");
          pages = formatPages;
        }
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

      ResultProductsModel results = ResultProductsModel(resProducts, pages);
      newState.resultProduct = results;
      emit(newState);

      return true;
    } catch (e) {
      return false;
    }
  }

  bool resetPagination() {
    try {
      var newState = state;
      newState.pagination.page = 1;
      newState.pagination.filter = "";
      newState.pagination.categoryFilter = getDefaultCategory();
      newState.pagination.limit = 10;
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }
}
