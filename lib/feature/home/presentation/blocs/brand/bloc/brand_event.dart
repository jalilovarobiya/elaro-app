part of 'brand_bloc.dart';

@freezed
class BrandEvent with _$BrandEvent {
  const factory BrandEvent.fetchData({required int id}) = _FetchData;
}
