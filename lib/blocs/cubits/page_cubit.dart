import 'package:bloc/bloc.dart';

class PageCubit extends Cubit<String> {
  PageCubit() : super("home");

  void setNewPage(String newTab) {
    emit(newTab);
  }
}
