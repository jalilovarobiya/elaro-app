// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'regions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegionsModel _$RegionsModelFromJson(Map<String, dynamic> json) {
  return _RegionsModel.fromJson(json);
}

/// @nodoc
mixin _$RegionsModel {
  @JsonKey(name: "regions")
  List<Region> get regions => throw _privateConstructorUsedError;
  @JsonKey(name: "districts")
  List<District> get districts => throw _privateConstructorUsedError;
  @JsonKey(name: "quarters")
  List<Quarter> get quarters => throw _privateConstructorUsedError;

  /// Serializes this RegionsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegionsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegionsModelCopyWith<RegionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionsModelCopyWith<$Res> {
  factory $RegionsModelCopyWith(
          RegionsModel value, $Res Function(RegionsModel) then) =
      _$RegionsModelCopyWithImpl<$Res, RegionsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "regions") List<Region> regions,
      @JsonKey(name: "districts") List<District> districts,
      @JsonKey(name: "quarters") List<Quarter> quarters});
}

/// @nodoc
class _$RegionsModelCopyWithImpl<$Res, $Val extends RegionsModel>
    implements $RegionsModelCopyWith<$Res> {
  _$RegionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegionsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regions = null,
    Object? districts = null,
    Object? quarters = null,
  }) {
    return _then(_value.copyWith(
      regions: null == regions
          ? _value.regions
          : regions // ignore: cast_nullable_to_non_nullable
              as List<Region>,
      districts: null == districts
          ? _value.districts
          : districts // ignore: cast_nullable_to_non_nullable
              as List<District>,
      quarters: null == quarters
          ? _value.quarters
          : quarters // ignore: cast_nullable_to_non_nullable
              as List<Quarter>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegionsModelImplCopyWith<$Res>
    implements $RegionsModelCopyWith<$Res> {
  factory _$$RegionsModelImplCopyWith(
          _$RegionsModelImpl value, $Res Function(_$RegionsModelImpl) then) =
      __$$RegionsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "regions") List<Region> regions,
      @JsonKey(name: "districts") List<District> districts,
      @JsonKey(name: "quarters") List<Quarter> quarters});
}

/// @nodoc
class __$$RegionsModelImplCopyWithImpl<$Res>
    extends _$RegionsModelCopyWithImpl<$Res, _$RegionsModelImpl>
    implements _$$RegionsModelImplCopyWith<$Res> {
  __$$RegionsModelImplCopyWithImpl(
      _$RegionsModelImpl _value, $Res Function(_$RegionsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegionsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regions = null,
    Object? districts = null,
    Object? quarters = null,
  }) {
    return _then(_$RegionsModelImpl(
      regions: null == regions
          ? _value._regions
          : regions // ignore: cast_nullable_to_non_nullable
              as List<Region>,
      districts: null == districts
          ? _value._districts
          : districts // ignore: cast_nullable_to_non_nullable
              as List<District>,
      quarters: null == quarters
          ? _value._quarters
          : quarters // ignore: cast_nullable_to_non_nullable
              as List<Quarter>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegionsModelImpl implements _RegionsModel {
  const _$RegionsModelImpl(
      {@JsonKey(name: "regions") required final List<Region> regions,
      @JsonKey(name: "districts") required final List<District> districts,
      @JsonKey(name: "quarters") required final List<Quarter> quarters})
      : _regions = regions,
        _districts = districts,
        _quarters = quarters;

  factory _$RegionsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegionsModelImplFromJson(json);

  final List<Region> _regions;
  @override
  @JsonKey(name: "regions")
  List<Region> get regions {
    if (_regions is EqualUnmodifiableListView) return _regions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_regions);
  }

  final List<District> _districts;
  @override
  @JsonKey(name: "districts")
  List<District> get districts {
    if (_districts is EqualUnmodifiableListView) return _districts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_districts);
  }

  final List<Quarter> _quarters;
  @override
  @JsonKey(name: "quarters")
  List<Quarter> get quarters {
    if (_quarters is EqualUnmodifiableListView) return _quarters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quarters);
  }

  @override
  String toString() {
    return 'RegionsModel(regions: $regions, districts: $districts, quarters: $quarters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegionsModelImpl &&
            const DeepCollectionEquality().equals(other._regions, _regions) &&
            const DeepCollectionEquality()
                .equals(other._districts, _districts) &&
            const DeepCollectionEquality().equals(other._quarters, _quarters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_regions),
      const DeepCollectionEquality().hash(_districts),
      const DeepCollectionEquality().hash(_quarters));

  /// Create a copy of RegionsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegionsModelImplCopyWith<_$RegionsModelImpl> get copyWith =>
      __$$RegionsModelImplCopyWithImpl<_$RegionsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegionsModelImplToJson(
      this,
    );
  }
}

abstract class _RegionsModel implements RegionsModel {
  const factory _RegionsModel(
          {@JsonKey(name: "regions") required final List<Region> regions,
          @JsonKey(name: "districts") required final List<District> districts,
          @JsonKey(name: "quarters") required final List<Quarter> quarters}) =
      _$RegionsModelImpl;

  factory _RegionsModel.fromJson(Map<String, dynamic> json) =
      _$RegionsModelImpl.fromJson;

  @override
  @JsonKey(name: "regions")
  List<Region> get regions;
  @override
  @JsonKey(name: "districts")
  List<District> get districts;
  @override
  @JsonKey(name: "quarters")
  List<Quarter> get quarters;

  /// Create a copy of RegionsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegionsModelImplCopyWith<_$RegionsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

District _$DistrictFromJson(Map<String, dynamic> json) {
  return _District.fromJson(json);
}

/// @nodoc
mixin _$District {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "region_id")
  int get regionId => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;

  /// Serializes this District to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of District
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DistrictCopyWith<District> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistrictCopyWith<$Res> {
  factory $DistrictCopyWith(District value, $Res Function(District) then) =
      _$DistrictCopyWithImpl<$Res, District>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "region_id") int regionId,
      @JsonKey(name: "name") String name});
}

/// @nodoc
class _$DistrictCopyWithImpl<$Res, $Val extends District>
    implements $DistrictCopyWith<$Res> {
  _$DistrictCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of District
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? regionId = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      regionId: null == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DistrictImplCopyWith<$Res>
    implements $DistrictCopyWith<$Res> {
  factory _$$DistrictImplCopyWith(
          _$DistrictImpl value, $Res Function(_$DistrictImpl) then) =
      __$$DistrictImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "region_id") int regionId,
      @JsonKey(name: "name") String name});
}

/// @nodoc
class __$$DistrictImplCopyWithImpl<$Res>
    extends _$DistrictCopyWithImpl<$Res, _$DistrictImpl>
    implements _$$DistrictImplCopyWith<$Res> {
  __$$DistrictImplCopyWithImpl(
      _$DistrictImpl _value, $Res Function(_$DistrictImpl) _then)
      : super(_value, _then);

  /// Create a copy of District
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? regionId = null,
    Object? name = null,
  }) {
    return _then(_$DistrictImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      regionId: null == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DistrictImpl implements _District {
  const _$DistrictImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "region_id") required this.regionId,
      @JsonKey(name: "name") required this.name});

  factory _$DistrictImpl.fromJson(Map<String, dynamic> json) =>
      _$$DistrictImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "region_id")
  final int regionId;
  @override
  @JsonKey(name: "name")
  final String name;

  @override
  String toString() {
    return 'District(id: $id, regionId: $regionId, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DistrictImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, regionId, name);

  /// Create a copy of District
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DistrictImplCopyWith<_$DistrictImpl> get copyWith =>
      __$$DistrictImplCopyWithImpl<_$DistrictImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DistrictImplToJson(
      this,
    );
  }
}

abstract class _District implements District {
  const factory _District(
      {@JsonKey(name: "id") required final int id,
      @JsonKey(name: "region_id") required final int regionId,
      @JsonKey(name: "name") required final String name}) = _$DistrictImpl;

  factory _District.fromJson(Map<String, dynamic> json) =
      _$DistrictImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "region_id")
  int get regionId;
  @override
  @JsonKey(name: "name")
  String get name;

  /// Create a copy of District
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DistrictImplCopyWith<_$DistrictImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Quarter _$QuarterFromJson(Map<String, dynamic> json) {
  return _Quarter.fromJson(json);
}

/// @nodoc
mixin _$Quarter {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "district_id")
  int get districtId => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;

  /// Serializes this Quarter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Quarter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuarterCopyWith<Quarter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuarterCopyWith<$Res> {
  factory $QuarterCopyWith(Quarter value, $Res Function(Quarter) then) =
      _$QuarterCopyWithImpl<$Res, Quarter>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "district_id") int districtId,
      @JsonKey(name: "name") String name});
}

/// @nodoc
class _$QuarterCopyWithImpl<$Res, $Val extends Quarter>
    implements $QuarterCopyWith<$Res> {
  _$QuarterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Quarter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? districtId = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      districtId: null == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuarterImplCopyWith<$Res> implements $QuarterCopyWith<$Res> {
  factory _$$QuarterImplCopyWith(
          _$QuarterImpl value, $Res Function(_$QuarterImpl) then) =
      __$$QuarterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "district_id") int districtId,
      @JsonKey(name: "name") String name});
}

/// @nodoc
class __$$QuarterImplCopyWithImpl<$Res>
    extends _$QuarterCopyWithImpl<$Res, _$QuarterImpl>
    implements _$$QuarterImplCopyWith<$Res> {
  __$$QuarterImplCopyWithImpl(
      _$QuarterImpl _value, $Res Function(_$QuarterImpl) _then)
      : super(_value, _then);

  /// Create a copy of Quarter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? districtId = null,
    Object? name = null,
  }) {
    return _then(_$QuarterImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      districtId: null == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuarterImpl implements _Quarter {
  const _$QuarterImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "district_id") required this.districtId,
      @JsonKey(name: "name") required this.name});

  factory _$QuarterImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuarterImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "district_id")
  final int districtId;
  @override
  @JsonKey(name: "name")
  final String name;

  @override
  String toString() {
    return 'Quarter(id: $id, districtId: $districtId, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuarterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.districtId, districtId) ||
                other.districtId == districtId) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, districtId, name);

  /// Create a copy of Quarter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuarterImplCopyWith<_$QuarterImpl> get copyWith =>
      __$$QuarterImplCopyWithImpl<_$QuarterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuarterImplToJson(
      this,
    );
  }
}

abstract class _Quarter implements Quarter {
  const factory _Quarter(
      {@JsonKey(name: "id") required final int id,
      @JsonKey(name: "district_id") required final int districtId,
      @JsonKey(name: "name") required final String name}) = _$QuarterImpl;

  factory _Quarter.fromJson(Map<String, dynamic> json) = _$QuarterImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "district_id")
  int get districtId;
  @override
  @JsonKey(name: "name")
  String get name;

  /// Create a copy of Quarter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuarterImplCopyWith<_$QuarterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Region _$RegionFromJson(Map<String, dynamic> json) {
  return _Region.fromJson(json);
}

/// @nodoc
mixin _$Region {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;

  /// Serializes this Region to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Region
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegionCopyWith<Region> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionCopyWith<$Res> {
  factory $RegionCopyWith(Region value, $Res Function(Region) then) =
      _$RegionCopyWithImpl<$Res, Region>;
  @useResult
  $Res call({@JsonKey(name: "id") int id, @JsonKey(name: "name") String name});
}

/// @nodoc
class _$RegionCopyWithImpl<$Res, $Val extends Region>
    implements $RegionCopyWith<$Res> {
  _$RegionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Region
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegionImplCopyWith<$Res> implements $RegionCopyWith<$Res> {
  factory _$$RegionImplCopyWith(
          _$RegionImpl value, $Res Function(_$RegionImpl) then) =
      __$$RegionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "id") int id, @JsonKey(name: "name") String name});
}

/// @nodoc
class __$$RegionImplCopyWithImpl<$Res>
    extends _$RegionCopyWithImpl<$Res, _$RegionImpl>
    implements _$$RegionImplCopyWith<$Res> {
  __$$RegionImplCopyWithImpl(
      _$RegionImpl _value, $Res Function(_$RegionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Region
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$RegionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegionImpl implements _Region {
  const _$RegionImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "name") required this.name});

  factory _$RegionImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegionImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "name")
  final String name;

  @override
  String toString() {
    return 'Region(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of Region
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegionImplCopyWith<_$RegionImpl> get copyWith =>
      __$$RegionImplCopyWithImpl<_$RegionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegionImplToJson(
      this,
    );
  }
}

abstract class _Region implements Region {
  const factory _Region(
      {@JsonKey(name: "id") required final int id,
      @JsonKey(name: "name") required final String name}) = _$RegionImpl;

  factory _Region.fromJson(Map<String, dynamic> json) = _$RegionImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "name")
  String get name;

  /// Create a copy of Region
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegionImplCopyWith<_$RegionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
