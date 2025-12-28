import 'package:learning/app/view/features/Home/domain/entities/dimension_entity.dart';
import 'package:learning/app/view/features/Home/domain/entities/meta_entity.dart';
import 'package:learning/app/view/features/Home/domain/entities/review_entity.dart';

class ProductEntity {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final int weight;
  final DimensionsEntity dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<ReviewEntity> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final MetaEntity meta;
  final List<String> images;

  const ProductEntity({
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

  factory ProductEntity.empty() => ProductEntity(
        id: 0,
        title: '',
        description: '',
        category: '',
        price: 0,
        discountPercentage: 0,
        rating: 0,
        stock: 0,
        tags: const [],
        brand: '',
        sku: '',
        weight: 0,
        dimensions: DimensionsEntity.empty(),
        warrantyInformation: '',
        shippingInformation: '',
        availabilityStatus: '',
        reviews: const [],
        returnPolicy: '',
        minimumOrderQuantity: 0,
        meta: MetaEntity.empty(),
        images: const [],
      );
}
