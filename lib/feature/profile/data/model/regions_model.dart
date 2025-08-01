import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'regions_model.freezed.dart';
part 'regions_model.g.dart';

@freezed
class RegionsModel with _$RegionsModel {
  const factory RegionsModel({
    @JsonKey(name: "regions") required List<Region> regions,
    @JsonKey(name: "districts") required List<District> districts,
    @JsonKey(name: "quarters") required List<Quarter> quarters,
  }) = _RegionsModel;

  factory RegionsModel.fromJson(Map<String, dynamic> json) =>
      _$RegionsModelFromJson(json);
}

@freezed
class District with _$District {
  const factory District({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "region_id") required int regionId,
    @JsonKey(name: "name") required String name,
  }) = _District;

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);
}

@freezed
class Quarter with _$Quarter {
  const factory Quarter({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "district_id") required int districtId,
    @JsonKey(name: "name") required String name,
  }) = _Quarter;

  factory Quarter.fromJson(Map<String, dynamic> json) =>
      _$QuarterFromJson(json);
}

@freezed
class Region with _$Region {
  const factory Region({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "name") required String name,
  }) = _Region;

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
}
