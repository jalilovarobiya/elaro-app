import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'search_model.freezed.dart';
part 'search_model.g.dart';

@freezed
class SearchModel with _$SearchModel {
  const factory SearchModel({
    @JsonKey(name: "products") List<Product>? products,
    @JsonKey(name: "categories") List<Category>? categories,
    @JsonKey(name: "sub_categories") List<SubCategory>? subCategories,
  }) = _SearchModel;

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name_uz") String? nameUz,
    @JsonKey(name: "name_ru") String? nameRu,
    @JsonKey(name: "name_crl") String? nameCrl,
    @JsonKey(name: "image_url") dynamic imageUrl,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
class Product with _$Product {
  const factory Product({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name_uz") String? nameUz,
    @JsonKey(name: "name_ru") String? nameRu,
    @JsonKey(name: "name_crl") String? nameCrl,
    @JsonKey(name: "images") List<Image>? images,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@freezed
class Image with _$Image {
  const factory Image({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "product_id") int? productId,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
    @JsonKey(name: "image_url") String? imageUrl,
  }) = _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}

@freezed
class SubCategory with _$SubCategory {
  const factory SubCategory({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name_uz") String? nameUz,
    @JsonKey(name: "name_ru") String? nameRu,
    @JsonKey(name: "name_crl") String? nameCrl,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "image_url") String? imageUrl,
  }) = _SubCategory;

  factory SubCategory.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryFromJson(json);
}
