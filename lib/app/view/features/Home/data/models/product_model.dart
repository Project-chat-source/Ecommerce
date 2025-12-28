import 'package:json_annotation/json_annotation.dart';
import 'package:learning/app/view/features/Home/data/models/dimensions_model.dart';
import 'package:learning/app/view/features/Home/data/models/meta_model.dart';
import 'package:learning/app/view/features/Home/data/models/reviews_model.dart';
import 'package:learning/app/view/features/Home/domain/entities/product_entity.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;

  @JsonKey(name: 'title', defaultValue: '')
  final String title;

  @JsonKey(name: 'description', defaultValue: '')
  final String description;

  @JsonKey(name: 'category', defaultValue: '')
  final String category;

  @JsonKey(name: 'price', defaultValue: 0.0)
  final double price;

  @JsonKey(name: 'discountPercentage', defaultValue: 0.0)
  final double discountPercentage;

  @JsonKey(name: 'rating', defaultValue: 0.0)
  final double rating;

  @JsonKey(name: 'stock', defaultValue: 0)
  final int stock;

  @JsonKey(name: 'tags', defaultValue: [])
  final List<String> tags;

  @JsonKey(name: 'brand', defaultValue: '')
  final String brand;

  @JsonKey(name: 'sku', defaultValue: '')
  final String sku;

  @JsonKey(name: 'weight', defaultValue: 0)
  final int weight;

  @JsonKey(name: 'dimensions', fromJson: dimensionsModelFromJson)
  final DimensionsModel dimensions;

  static DimensionsModel dimensionsModelFromJson(dynamic json) {
    return json == null
        ? DimensionsModel.empty()
        : DimensionsModel.fromJson(json);
  }

  @JsonKey(name: 'warrantyInformation', defaultValue: '')
  final String warrantyInformation;

  @JsonKey(name: 'shippingInformation', defaultValue: '')
  final String shippingInformation;

  @JsonKey(name: 'availabilityStatus', defaultValue: '')
  final String availabilityStatus;

  @JsonKey(name: 'reviews', defaultValue: [], fromJson: reviewsModelFromJson)
  final List<ReviewsModel> reviews;

  static List<ReviewsModel> reviewsModelFromJson(dynamic json) {
    if (json is List) {
      return json.map((e) => ReviewsModel.fromJson(e)).toList();
    }

    return [];
  }

  @JsonKey(name: 'returnPolicy', defaultValue: '')
  final String returnPolicy;

  @JsonKey(name: 'minimumOrderQuantity', defaultValue: 0)
  final int minimumOrderQuantity;

  @JsonKey(name: 'meta', fromJson: metaModelFromJson)
  final MetaModel meta;

  static MetaModel metaModelFromJson(dynamic json) {
    return json == null
        ? MetaModel.empty()
        : MetaModel.fromJson(json as Map<String, dynamic>);
  }

  @JsonKey(name: 'images', defaultValue: [])
  final List<String> images;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
  });

  factory ProductModel.empty() => ProductModel(
    id: 0,
    title: '',
    description: '',
    category: '',
    price: 0,
    discountPercentage: 0,
    rating: 0,
    stock: 0,
    tags: [],
    brand: '',
    sku: '',
    weight: 0,
    dimensions: DimensionsModel.empty(),
    warrantyInformation: '',
    shippingInformation: '',
    availabilityStatus: '',
    reviews: [],
    returnPolicy: '',
    minimumOrderQuantity: 0,
    meta: MetaModel.empty(),
    images: [],
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  ProductEntity toDomain() => ProductEntity(
    id: id,
    title: title,
    description: description,
    category: category,
    price: price,
    discountPercentage: discountPercentage,
    rating: rating,
    stock: stock,
    tags: tags,
    brand: brand,
    sku: sku,
    weight: weight,
    dimensions: dimensions.toDomain(),
    warrantyInformation: warrantyInformation,
    shippingInformation: shippingInformation,
    availabilityStatus: availabilityStatus,
    reviews: reviews.map((e) => e.toDomain()).toList(),
    returnPolicy: returnPolicy,
    minimumOrderQuantity: minimumOrderQuantity,
    meta: meta.toDomain(),
    images: images,
  );
}
