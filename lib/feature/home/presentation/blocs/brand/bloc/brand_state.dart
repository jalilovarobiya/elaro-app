part of 'brand_bloc.dart';

@freezed
class BrandState with _$BrandState {
  const factory BrandState.loading() = _Loading;
  const factory BrandState.success({required BrandModel data}) = _Success;
  const factory BrandState.failure({required FailureModel data}) = _Failure;
}
