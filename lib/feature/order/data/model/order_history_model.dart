import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'order_history_model.freezed.dart';
part 'order_history_model.g.dart';

@freezed
class OrderHistoryModel with _$OrderHistoryModel {
  const factory OrderHistoryModel({@JsonKey(name: "data") List<Datum>? data}) =
      _OrderHistoryModel;

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryModelFromJson(json);
}

@freezed
class Datum with _$Datum {
  const factory Datum({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "total_amount") String? totalAmount,
    @JsonKey(name: "order_date_time") String? orderDateTime,
    @JsonKey(name: "shipping_address") String? shippingAddress,
    @JsonKey(name: "url") String? url,
    @JsonKey(name: "products") List<Product>? products,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

@freezed
class Product with _$Product {
  const factory Product({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name_uz") String? nameUz,
    @JsonKey(name: "name_crl") String? nameCrl,
    @JsonKey(name: "name_ru") String? nameRu,
    @JsonKey(name: "color") String? color,
    @JsonKey(name: "price") String? price,
    @JsonKey(name: "qty") int? qty,
    @JsonKey(name: "discounted_price") int? discountedPrice,
    @JsonKey(name: "discount") String? discount,
    @JsonKey(name: "discount_type") String? discountType,
    @JsonKey(name: "discount_start") String? discountStart,
    @JsonKey(name: "discount_end") String? discountEnd,
    @JsonKey(name: "description_uz") String? descriptionUz,
    @JsonKey(name: "description_crl") String? descriptionCrl,
    @JsonKey(name: "description_ru") String? descriptionRu,
    @JsonKey(name: "category_id") int? categoryId,
    @JsonKey(name: "brand_id") int? brandId,
    @JsonKey(name: "images") List<Image>? images,
    @JsonKey(name: "attributes") List<Attribute>? attributes,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@freezed
class Attribute with _$Attribute {
  const factory Attribute({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name_uz") String? nameUz,
    @JsonKey(name: "name_crl") String? nameCrl,
    @JsonKey(name: "name_ru") String? nameRu,
    @JsonKey(name: "value_uz") String? valueUz,
    @JsonKey(name: "value_crl") String? valueCrl,
    @JsonKey(name: "value_ru") String? valueRu,
  }) = _Attribute;

  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);
}

@freezed
class Image with _$Image {
  const factory Image({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "image") String? image,
  }) = _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
