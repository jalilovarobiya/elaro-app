// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchModelImpl _$$SearchModelImplFromJson(Map<String, dynamic> json) =>
    _$SearchModelImpl(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      subCategories: (json['sub_categories'] as List<dynamic>?)
          ?.map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SearchModelImplToJson(_$SearchModelImpl instance) =>
    <String, dynamic>{
      'products': instance.products,
      'categories': instance.categories,
      'sub_categories': instance.subCategories,
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: (json['id'] as num?)?.toInt(),
      nameUz: json['name_uz'] as String?,
      nameRu: json['name_ru'] as String?,
      nameCrl: json['name_crl'] as String?,
      imageUrl: json['image_url'],
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_uz': instance.nameUz,
      'name_ru': instance.nameRu,
      'name_crl': instance.nameCrl,
      'image_url': instance.imageUrl,
    };

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: (json['id'] as num?)?.toInt(),
      nameUz: json['name_uz'] as String?,
      nameRu: json['name_ru'] as String?,
      nameCrl: json['name_crl'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_uz': instance.nameUz,
      'name_ru': instance.nameRu,
      'name_crl': instance.nameCrl,
      'images': instance.images,
    };

_$ImageImpl _$$ImageImplFromJson(Map<String, dynamic> json) => _$ImageImpl(
      id: (json['id'] as num?)?.toInt(),
      image: json['image'] as String?,
      productId: (json['product_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$$ImageImplToJson(_$ImageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'product_id': instance.productId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'image_url': instance.imageUrl,
    };

_$SubCategoryImpl _$$SubCategoryImplFromJson(Map<String, dynamic> json) =>
    _$SubCategoryImpl(
      id: (json['id'] as num?)?.toInt(),
      nameUz: json['name_uz'] as String?,
      nameRu: json['name_ru'] as String?,
      nameCrl: json['name_crl'] as String?,
      image: json['image'] as String?,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$$SubCategoryImplToJson(_$SubCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_uz': instance.nameUz,
      'name_ru': instance.nameRu,
      'name_crl': instance.nameCrl,
      'image': instance.image,
      'image_url': instance.imageUrl,
    };
