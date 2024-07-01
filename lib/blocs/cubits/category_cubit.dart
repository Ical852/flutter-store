import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part '../states/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
}
