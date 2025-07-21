import 'package:bloc/bloc.dart';
import 'package:elaro_app/core/failure/failure_model.dart';
import 'package:elaro_app/feature/home/data/model/products_model.dart';
import 'package:elaro_app/feature/home/data/repository/products_repository_impl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_event.dart';
part 'products_state.dart';
part 'products_bloc.freezed.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepositoryImpl impl;
  List<Datum> _products = [];

  ProductsBloc(this.impl) : super(ProductsState.loading()) {
    on<_FetchData>(_fetchData);
  }

  Future<void> _fetchData(_FetchData event, Emitter<ProductsState> emit) async {
    final nextIndex = _products.length ~/ 10 + 1;
    try {
      final request = await impl.products(pageIndex: nextIndex);

      request.fold((left) => emit(ProductsState.failure(data: left)), (right) {
        final newData = right.data ?? [];

        if (newData.isEmpty) return;
        _products.addAll(newData);

        emit(ProductsState.success(data: ProductsModel(data: _products)));
      });
    } catch (e) {
      emit(ProductsState.failure(data: FailureModel(e.toString())));
    }
  }
}
