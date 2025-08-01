part of 'region_bloc.dart';

@freezed
class RegionState with _$RegionState {
  const factory RegionState.loading() = _Loading;
  const factory RegionState.success({required RegionsModel profile}) = _Success;
  const factory RegionState.failure({required FailureModel failure}) = _Failure;
}
