import 'package:bloc/bloc.dart';
import 'package:elaro_app/core/failure/failure_model.dart';
import 'package:elaro_app/feature/profile/data/model/regions_model.dart';
import 'package:elaro_app/feature/profile/data/repository/region_repository_impl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'region_event.dart';
part 'region_state.dart';
part 'region_bloc.freezed.dart';

class RegionBloc extends Bloc<RegionEvent, RegionState> {
  final RegionRepositoryImpl impl;

  RegionBloc(this.impl) : super(RegionState.loading()) {
    on<_Started>(_fetchRegion);
  }
  _fetchRegion(_Started event, Emitter<RegionState> emit) async {
    try {
      emit(RegionState.loading());
      final request = await impl.fetchRegion();

      request.fold((left) => emit(RegionState.failure(failure: left)),
          (right) => emit(RegionState.success(profile: right)));
    } catch (e) {
      emit(RegionState.failure(failure: FailureModel(e.toString())));
    }
  }
}
