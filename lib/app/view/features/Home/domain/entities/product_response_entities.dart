import 'package:learning/app/view/features/Home/data/models/product_model.dart';

class ProductResponseEntities {
  final List<ProductModel> products;
  final int total;
  final int skip;
  final int limit;

  ProductResponseEntities({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductResponseEntities.empty() =>
      ProductResponseEntities(products: [], total: 0, skip: 0, limit: 0);
}
