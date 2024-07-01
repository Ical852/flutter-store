import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterstore/models/category_model.dart';

part '../states/category_state.dart';

class CategoryCubit extends Cubit<List<CategoryModel>> {
  CategoryCubit() : super([]);

  bool submitCategory(CategoryModel category) {
    try {
      var newState = state;
      newState.add(category);
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool editCategory(CategoryModel category, String id) {
    try {
      var newState = state;
      int index = newState.indexWhere((category) => category.id == id);

      if (index != -1) {
        newState[index] = category;
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
      state.removeWhere((category) => category.id == id);
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

}
