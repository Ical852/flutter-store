import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part '../states/page_state.dart';

class PageCubit extends Cubit<String> {
  PageCubit() : super("home");

  void setNewPage(String newTab) {
    emit(newTab);
  }
}
