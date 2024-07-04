import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part '../states/search_state.dart';

class SearchCubit extends Cubit<List<String>> {
  SearchCubit() : super([]);

  bool addHistory(String search) {
    try {
      var newState = state;
      state.add(search);
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool deleteHistory(String search) {
    try {
      var newState = state;
      newState.removeWhere((currentSearch) => currentSearch == search);
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool resetHistory() {
    try {
      emit([]);
      return true;
    } catch (e) {
      return false;
    }
  }
}
