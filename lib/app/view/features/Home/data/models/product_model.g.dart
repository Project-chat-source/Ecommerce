// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  id: (json['id'] as num?)?.toInt() ?? 0,
  title: json['title'] as String? ?? '',
  description: json['description'] as String? ?? '',
  category: json['category'] as String? ?? '',
  price: (json['price'] as num?)?.toDouble() ?? 0.0,
  discountPercentage: (json['discountPercentage'] as num?)?.toDouble() ?? 0.0,
  rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
  stock: (json['stock'] as num?)?.toInt() ?? 0,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
  brand: json['brand'] as String? ?? '',
  sku: json['sku'] as String? ?? '',
  weight: (json['weight'] as num?)?.toInt() ?? 0,
  dimensions: ProductModel.dimensionsModelFromJson(json['dimensions']),
  warrantyInformation: json['warrantyInformation'] as String? ?? '',
  shippingInformation: json['shippingInformation'] as String? ?? '',
  availabilityStatus: json['availabilityStatus'] as String? ?? '',
  reviews: json['reviews'] == null
      ? []
      : ProductModel.reviewsModelFromJson(json['reviews']),
  returnPolicy: json['returnPolicy'] as String? ?? '',
  minimumOrderQuantity: (json['minimumOrderQuantity'] as num?)?.toInt() ?? 0,
  meta: ProductModel.metaModelFromJson(json['meta']),
  images:
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      [],
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'price': instance.price,
      'discountPercentage': instance.discountPercentage,
      'rating': instance.rating,
      'stock': instance.stock,
      'tags': instance.tags,
      'brand': instance.brand,
      'sku': instance.sku,
      'weight': instance.weight,
      'dimensions': instance.dimensions,
      'warrantyInformation': instance.warrantyInformation,
      'shippingInformation': instance.shippingInformation,
      'availabilityStatus': instance.availabilityStatus,
      'reviews': instance.reviews,
      'returnPolicy': instance.returnPolicy,
      'minimumOrderQuantity': instance.minimumOrderQuantity,
      'meta': instance.meta,
      'images': instance.images,
    };
