// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegionsModelImpl _$$RegionsModelImplFromJson(Map<String, dynamic> json) =>
    _$RegionsModelImpl(
      regions: (json['regions'] as List<dynamic>)
          .map((e) => Region.fromJson(e as Map<String, dynamic>))
          .toList(),
      districts: (json['districts'] as List<dynamic>)
          .map((e) => District.fromJson(e as Map<String, dynamic>))
          .toList(),
      quarters: (json['quarters'] as List<dynamic>)
          .map((e) => Quarter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RegionsModelImplToJson(_$RegionsModelImpl instance) =>
    <String, dynamic>{
      'regions': instance.regions,
      'districts': instance.districts,
      'quarters': instance.quarters,
    };

_$DistrictImpl _$$DistrictImplFromJson(Map<String, dynamic> json) =>
    _$DistrictImpl(
      id: (json['id'] as num).toInt(),
      regionId: (json['region_id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$DistrictImplToJson(_$DistrictImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'region_id': instance.regionId,
      'name': instance.name,
    };

_$QuarterImpl _$$QuarterImplFromJson(Map<String, dynamic> json) =>
    _$QuarterImpl(
      id: (json['id'] as num).toInt(),
      districtId: (json['district_id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$QuarterImplToJson(_$QuarterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'district_id': instance.districtId,
      'name': instance.name,
    };

_$RegionImpl _$$RegionImplFromJson(Map<String, dynamic> json) => _$RegionImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$RegionImplToJson(_$RegionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
