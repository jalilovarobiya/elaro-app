import 'package:bloc/bloc.dart';
import 'package:elaro_app/core/failure/failure_model.dart';
import 'package:elaro_app/feature/home/data/model/brend_model.dart';
import 'package:elaro_app/feature/home/data/repository/brendS_repository_impl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand_event.dart';
part 'brand_state.dart';
part 'brand_bloc.freezed.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  final BrendsRepositoryImpl impl;

  BrandBloc(this.impl) : super(BrandState.loading()) {
    on<_FetchData>(_fetchData);
  }

  _fetchData(_FetchData event, Emitter<BrandState> emit) async {
    try {
      final request = await impl.brend(event.id);
      request.fold(
        (left) => emit(BrandState.failure(data: left)),
        (right) => emit(BrandState.success(data: right)),
      );
    } catch (e) {
      emit(BrandState.failure(data: FailureModel(e.toString())));
    }
  }
}
