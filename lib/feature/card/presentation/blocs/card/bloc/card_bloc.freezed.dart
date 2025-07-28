// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchData,
    required TResult Function(Datum product) addProduct,
    required TResult Function(String id, int quantity) clearCart,
    required TResult Function(String id, int count) updateQuantity,
    required TResult Function(String id) removeProduct,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchData,
    TResult? Function(Datum product)? addProduct,
    TResult? Function(String id, int quantity)? clearCart,
    TResult? Function(String id, int count)? updateQuantity,
    TResult? Function(String id)? removeProduct,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchData,
    TResult Function(Datum product)? addProduct,
    TResult Function(String id, int quantity)? clearCart,
    TResult Function(String id, int count)? updateQuantity,
    TResult Function(String id)? removeProduct,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchData value) fetchData,
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_RemoveProduct value) removeProduct,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchData value)? fetchData,
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_RemoveProduct value)? removeProduct,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchData value)? fetchData,
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_RemoveProduct value)? removeProduct,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardEventCopyWith<$Res> {
  factory $CardEventCopyWith(CardEvent value, $Res Function(CardEvent) then) =
      _$CardEventCopyWithImpl<$Res, CardEvent>;
}

/// @nodoc
class _$CardEventCopyWithImpl<$Res, $Val extends CardEvent>
    implements $CardEventCopyWith<$Res> {
  _$CardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CardEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchDataImplCopyWith<$Res> {
  factory _$$FetchDataImplCopyWith(
    _$FetchDataImpl value,
    $Res Function(_$FetchDataImpl) then,
  ) = __$$FetchDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchDataImplCopyWithImpl<$Res>
    extends _$CardEventCopyWithImpl<$Res, _$FetchDataImpl>
    implements _$$FetchDataImplCopyWith<$Res> {
  __$$FetchDataImplCopyWithImpl(
    _$FetchDataImpl _value,
    $Res Function(_$FetchDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CardEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchDataImpl implements _FetchData {
  const _$FetchDataImpl();

  @override
  String toString() {
    return 'CardEvent.fetchData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchData,
    required TResult Function(Datum product) addProduct,
    required TResult Function(String id, int quantity) clearCart,
    required TResult Function(String id, int count) updateQuantity,
    required TResult Function(String id) removeProduct,
  }) {
    return fetchData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchData,
    TResult? Function(Datum product)? addProduct,
    TResult? Function(String id, int quantity)? clearCart,
    TResult? Function(String id, int count)? updateQuantity,
    TResult? Function(String id)? removeProduct,
  }) {
    return fetchData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchData,
    TResult Function(Datum product)? addProduct,
    TResult Function(String id, int quantity)? clearCart,
    TResult Function(String id, int count)? updateQuantity,
    TResult Function(String id)? removeProduct,
    required TResult orElse(),
  }) {
    if (fetchData != null) {
      return fetchData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchData value) fetchData,
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_RemoveProduct value) removeProduct,
  }) {
    return fetchData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchData value)? fetchData,
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_RemoveProduct value)? removeProduct,
  }) {
    return fetchData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchData value)? fetchData,
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_RemoveProduct value)? removeProduct,
    required TResult orElse(),
  }) {
    if (fetchData != null) {
      return fetchData(this);
    }
    return orElse();
  }
}

abstract class _FetchData implements CardEvent {
  const factory _FetchData() = _$FetchDataImpl;
}

/// @nodoc
abstract class _$$AddProductImplCopyWith<$Res> {
  factory _$$AddProductImplCopyWith(
    _$AddProductImpl value,
    $Res Function(_$AddProductImpl) then,
  ) = __$$AddProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Datum product});

  $DatumCopyWith<$Res> get product;
}

/// @nodoc
class __$$AddProductImplCopyWithImpl<$Res>
    extends _$CardEventCopyWithImpl<$Res, _$AddProductImpl>
    implements _$$AddProductImplCopyWith<$Res> {
  __$$AddProductImplCopyWithImpl(
    _$AddProductImpl _value,
    $Res Function(_$AddProductImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? product = null}) {
    return _then(
      _$AddProductImpl(
        null == product
            ? _value.product
            : product // ignore: cast_nullable_to_non_nullable
                as Datum,
      ),
    );
  }

  /// Create a copy of CardEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DatumCopyWith<$Res> get product {
    return $DatumCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc

class _$AddProductImpl implements _AddProduct {
  const _$AddProductImpl(this.product);

  @override
  final Datum product;

  @override
  String toString() {
    return 'CardEvent.addProduct(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddProductImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  /// Create a copy of CardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddProductImplCopyWith<_$AddProductImpl> get copyWith =>
      __$$AddProductImplCopyWithImpl<_$AddProductImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchData,
    required TResult Function(Datum product) addProduct,
    required TResult Function(String id, int quantity) clearCart,
    required TResult Function(String id, int count) updateQuantity,
    required TResult Function(String id) removeProduct,
  }) {
    return addProduct(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchData,
    TResult? Function(Datum product)? addProduct,
    TResult? Function(String id, int quantity)? clearCart,
    TResult? Function(String id, int count)? updateQuantity,
    TResult? Function(String id)? removeProduct,
  }) {
    return addProduct?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchData,
    TResult Function(Datum product)? addProduct,
    TResult Function(String id, int quantity)? clearCart,
    TResult Function(String id, int count)? updateQuantity,
    TResult Function(String id)? removeProduct,
    required TResult orElse(),
  }) {
    if (addProduct != null) {
      return addProduct(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchData value) fetchData,
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_RemoveProduct value) removeProduct,
  }) {
    return addProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchData value)? fetchData,
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_RemoveProduct value)? removeProduct,
  }) {
    return addProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchData value)? fetchData,
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_RemoveProduct value)? removeProduct,
    required TResult orElse(),
  }) {
    if (addProduct != null) {
      return addProduct(this);
    }
    return orElse();
  }
}

abstract class _AddProduct implements CardEvent {
  const factory _AddProduct(final Datum product) = _$AddProductImpl;

  Datum get product;

  /// Create a copy of CardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddProductImplCopyWith<_$AddProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearCartImplCopyWith<$Res> {
  factory _$$ClearCartImplCopyWith(
    _$ClearCartImpl value,
    $Res Function(_$ClearCartImpl) then,
  ) = __$$ClearCartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, int quantity});
}

/// @nodoc
class __$$ClearCartImplCopyWithImpl<$Res>
    extends _$CardEventCopyWithImpl<$Res, _$ClearCartImpl>
    implements _$$ClearCartImplCopyWith<$Res> {
  __$$ClearCartImplCopyWithImpl(
    _$ClearCartImpl _value,
    $Res Function(_$ClearCartImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? quantity = null}) {
    return _then(
      _$ClearCartImpl(
        null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                as String,
        null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

class _$ClearCartImpl implements _ClearCart {
  const _$ClearCartImpl(this.id, this.quantity);

  @override
  final String id;
  @override
  final int quantity;

  @override
  String toString() {
    return 'CardEvent.clearCart(id: $id, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClearCartImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, quantity);

  /// Create a copy of CardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClearCartImplCopyWith<_$ClearCartImpl> get copyWith =>
      __$$ClearCartImplCopyWithImpl<_$ClearCartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchData,
    required TResult Function(Datum product) addProduct,
    required TResult Function(String id, int quantity) clearCart,
    required TResult Function(String id, int count) updateQuantity,
    required TResult Function(String id) removeProduct,
  }) {
    return clearCart(id, quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchData,
    TResult? Function(Datum product)? addProduct,
    TResult? Function(String id, int quantity)? clearCart,
    TResult? Function(String id, int count)? updateQuantity,
    TResult? Function(String id)? removeProduct,
  }) {
    return clearCart?.call(id, quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchData,
    TResult Function(Datum product)? addProduct,
    TResult Function(String id, int quantity)? clearCart,
    TResult Function(String id, int count)? updateQuantity,
    TResult Function(String id)? removeProduct,
    required TResult orElse(),
  }) {
    if (clearCart != null) {
      return clearCart(id, quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchData value) fetchData,
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_RemoveProduct value) removeProduct,
  }) {
    return clearCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchData value)? fetchData,
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_RemoveProduct value)? removeProduct,
  }) {
    return clearCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchData value)? fetchData,
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_RemoveProduct value)? removeProduct,
    required TResult orElse(),
  }) {
    if (clearCart != null) {
      return clearCart(this);
    }
    return orElse();
  }
}

abstract class _ClearCart implements CardEvent {
  const factory _ClearCart(final String id, final int quantity) =
      _$ClearCartImpl;

  String get id;
  int get quantity;

  /// Create a copy of CardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClearCartImplCopyWith<_$ClearCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateQuantityImplCopyWith<$Res> {
  factory _$$UpdateQuantityImplCopyWith(
    _$UpdateQuantityImpl value,
    $Res Function(_$UpdateQuantityImpl) then,
  ) = __$$UpdateQuantityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, int count});
}

/// @nodoc
class __$$UpdateQuantityImplCopyWithImpl<$Res>
    extends _$CardEventCopyWithImpl<$Res, _$UpdateQuantityImpl>
    implements _$$UpdateQuantityImplCopyWith<$Res> {
  __$$UpdateQuantityImplCopyWithImpl(
    _$UpdateQuantityImpl _value,
    $Res Function(_$UpdateQuantityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? count = null}) {
    return _then(
      _$UpdateQuantityImpl(
        null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                as String,
        null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

class _$UpdateQuantityImpl implements _UpdateQuantity {
  const _$UpdateQuantityImpl(this.id, this.count);

  @override
  final String id;
  @override
  final int count;

  @override
  String toString() {
    return 'CardEvent.updateQuantity(id: $id, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateQuantityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, count);

  /// Create a copy of CardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateQuantityImplCopyWith<_$UpdateQuantityImpl> get copyWith =>
      __$$UpdateQuantityImplCopyWithImpl<_$UpdateQuantityImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchData,
    required TResult Function(Datum product) addProduct,
    required TResult Function(String id, int quantity) clearCart,
    required TResult Function(String id, int count) updateQuantity,
    required TResult Function(String id) removeProduct,
  }) {
    return updateQuantity(id, count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchData,
    TResult? Function(Datum product)? addProduct,
    TResult? Function(String id, int quantity)? clearCart,
    TResult? Function(String id, int count)? updateQuantity,
    TResult? Function(String id)? removeProduct,
  }) {
    return updateQuantity?.call(id, count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchData,
    TResult Function(Datum product)? addProduct,
    TResult Function(String id, int quantity)? clearCart,
    TResult Function(String id, int count)? updateQuantity,
    TResult Function(String id)? removeProduct,
    required TResult orElse(),
  }) {
    if (updateQuantity != null) {
      return updateQuantity(id, count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchData value) fetchData,
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_RemoveProduct value) removeProduct,
  }) {
    return updateQuantity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchData value)? fetchData,
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_RemoveProduct value)? removeProduct,
  }) {
    return updateQuantity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchData value)? fetchData,
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_RemoveProduct value)? removeProduct,
    required TResult orElse(),
  }) {
    if (updateQuantity != null) {
      return updateQuantity(this);
    }
    return orElse();
  }
}

abstract class _UpdateQuantity implements CardEvent {
  const factory _UpdateQuantity(final String id, final int count) =
      _$UpdateQuantityImpl;

  String get id;
  int get count;

  /// Create a copy of CardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateQuantityImplCopyWith<_$UpdateQuantityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveProductImplCopyWith<$Res> {
  factory _$$RemoveProductImplCopyWith(
    _$RemoveProductImpl value,
    $Res Function(_$RemoveProductImpl) then,
  ) = __$$RemoveProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$RemoveProductImplCopyWithImpl<$Res>
    extends _$CardEventCopyWithImpl<$Res, _$RemoveProductImpl>
    implements _$$RemoveProductImplCopyWith<$Res> {
  __$$RemoveProductImplCopyWithImpl(
    _$RemoveProductImpl _value,
    $Res Function(_$RemoveProductImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _$RemoveProductImpl(
        null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$RemoveProductImpl implements _RemoveProduct {
  const _$RemoveProductImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'CardEvent.removeProduct(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveProductImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of CardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveProductImplCopyWith<_$RemoveProductImpl> get copyWith =>
      __$$RemoveProductImplCopyWithImpl<_$RemoveProductImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchData,
    required TResult Function(Datum product) addProduct,
    required TResult Function(String id, int quantity) clearCart,
    required TResult Function(String id, int count) updateQuantity,
    required TResult Function(String id) removeProduct,
  }) {
    return removeProduct(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchData,
    TResult? Function(Datum product)? addProduct,
    TResult? Function(String id, int quantity)? clearCart,
    TResult? Function(String id, int count)? updateQuantity,
    TResult? Function(String id)? removeProduct,
  }) {
    return removeProduct?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchData,
    TResult Function(Datum product)? addProduct,
    TResult Function(String id, int quantity)? clearCart,
    TResult Function(String id, int count)? updateQuantity,
    TResult Function(String id)? removeProduct,
    required TResult orElse(),
  }) {
    if (removeProduct != null) {
      return removeProduct(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchData value) fetchData,
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_RemoveProduct value) removeProduct,
  }) {
    return removeProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchData value)? fetchData,
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_RemoveProduct value)? removeProduct,
  }) {
    return removeProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchData value)? fetchData,
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_RemoveProduct value)? removeProduct,
    required TResult orElse(),
  }) {
    if (removeProduct != null) {
      return removeProduct(this);
    }
    return orElse();
  }
}

abstract class _RemoveProduct implements CardEvent {
  const factory _RemoveProduct(final String id) = _$RemoveProductImpl;

  String get id;

  /// Create a copy of CardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveProductImplCopyWith<_$RemoveProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CardState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Datum> data, int? qty) success,
    required TResult Function() failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Datum> data, int? qty)? success,
    TResult? Function()? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Datum> data, int? qty)? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardStateCopyWith<$Res> {
  factory $CardStateCopyWith(CardState value, $Res Function(CardState) then) =
      _$CardStateCopyWithImpl<$Res, CardState>;
}

/// @nodoc
class _$CardStateCopyWithImpl<$Res, $Val extends CardState>
    implements $CardStateCopyWith<$Res> {
  _$CardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CardState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$CardStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CardState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'CardState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Datum> data, int? qty) success,
    required TResult Function() failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Datum> data, int? qty)? success,
    TResult? Function()? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Datum> data, int? qty)? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CardState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
    _$SuccessImpl value,
    $Res Function(_$SuccessImpl) then,
  ) = __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Datum> data, int? qty});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$CardStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl _value,
    $Res Function(_$SuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null, Object? qty = freezed}) {
    return _then(
      _$SuccessImpl(
        data:
            null == data
                ? _value._data
                : data // ignore: cast_nullable_to_non_nullable
                    as List<Datum>,
        qty:
            freezed == qty
                ? _value.qty
                : qty // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl({required final List<Datum> data, required this.qty})
    : _data = data;

  final List<Datum> _data;
  @override
  List<Datum> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int? qty;

  @override
  String toString() {
    return 'CardState.success(data: $data, qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.qty, qty) || other.qty == qty));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data), qty);

  /// Create a copy of CardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Datum> data, int? qty) success,
    required TResult Function() failure,
  }) {
    return success(data, qty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Datum> data, int? qty)? success,
    TResult? Function()? failure,
  }) {
    return success?.call(data, qty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Datum> data, int? qty)? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data, qty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements CardState {
  const factory _Success({
    required final List<Datum> data,
    required final int? qty,
  }) = _$SuccessImpl;

  List<Datum> get data;
  int? get qty;

  /// Create a copy of CardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
    _$FailureImpl value,
    $Res Function(_$FailureImpl) then,
  ) = __$$FailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$CardStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
    _$FailureImpl _value,
    $Res Function(_$FailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CardState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl();

  @override
  String toString() {
    return 'CardState.failure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Datum> data, int? qty) success,
    required TResult Function() failure,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Datum> data, int? qty)? success,
    TResult? Function()? failure,
  }) {
    return failure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Datum> data, int? qty)? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements CardState {
  const factory _Failure() = _$FailureImpl;
}
