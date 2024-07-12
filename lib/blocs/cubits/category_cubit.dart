import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterstore/functions/global_func.dart';
import 'package:flutterstore/models/category_bloc_model.dart';
import 'package:flutterstore/models/category_model.dart';

part '../states/category_state.dart';

class CategoryCubit extends Cubit<CategoryBlocModel> {
  CategoryCubit() : super(generateCategory());

  bool filter(String name) {
    try {
      var newState = state;
      newState.filtered = newState.categories
        .where((category) => category.name.toLowerCase().contains(name.toLowerCase()))
        .toList();
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool resetFilter() {
    try {
      var newState = state;
      newState.filtered = [];
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool setCurrent(CategoryModel category) {
    try {
      var newState = state;
      state.current = category;
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool submitCategory(CategoryModel category) {
    try {
      var newState = state;
      newState.categories.insert(0, category);
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool editCategory(CategoryModel category, String id) {
    try {
      var newState = state;
      int index = newState.categories.indexWhere((category) => category.id == id);

      if (index != -1) {
        newState.categories[index] = category;
        emit(newState);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  bool deleteCategory(String id) {
    try {
      var newState = state;
      state.categories.removeWhere((category) => category.id == id);
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }
}
