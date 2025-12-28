import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learning/app/view/features/Home/data/models/product_model.dart';
import 'package:learning/app/view/features/Home/domain/entities/product_response_entities.dart';
part 'product_response_model.g.dart';

@JsonSerializable()
class ProductResponseModel {
  @JsonKey(name: 'products', defaultValue: [])
  final List<ProductModel> products;

  @JsonKey(name: 'total', defaultValue: 0)
  final int total;

  @JsonKey(name: 'skip', defaultValue: 0)
  final int skip;

  @JsonKey(name: 'limit', defaultValue: 0)
  final int limit;

  ProductResponseModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseModelToJson(this);

  ProductResponseEntities toDomain() => ProductResponseEntities(
    products: products,
    total: total,
    skip: skip,
    limit: limit,
  );
}
