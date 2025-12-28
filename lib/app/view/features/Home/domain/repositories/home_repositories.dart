import 'package:dartz/dartz.dart';
import 'package:learning/app/global/failure/failure.dart';
import 'package:learning/app/view/features/Home/domain/entities/product_response_entities.dart';

abstract class HomeRepositories {
  Future<Either<Failure, ProductResponseEntities>> loadProducts();
}
