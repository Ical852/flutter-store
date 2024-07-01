import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part '../states/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
}
