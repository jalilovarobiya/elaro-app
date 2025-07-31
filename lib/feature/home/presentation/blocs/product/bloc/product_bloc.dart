import 'package:bloc/bloc.dart';
import 'package:elaro_app/core/failure/failure_model.dart';
import 'package:elaro_app/feature/home/data/model/product_model.dart';
import 'package:elaro_app/feature/home/data/repository/products_repository_impl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_event.dart';

part 'product_state.dart';

part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductsRepositoryImpl impl;

  ProductBloc(this.impl) : super(ProductState.loading()) {
    on<_FetchData>(_fetchData);
  }

  Future<void> _fetchData(_FetchData event, Emitter<ProductState> emit) async {
    emit(const ProductState.loading());

    final request = await impl.product(event.id);
    request.fold(
      (left) => emit(ProductState.failure(left)),
      (right) => emit(ProductState.success(right)),
    );
  }
}
