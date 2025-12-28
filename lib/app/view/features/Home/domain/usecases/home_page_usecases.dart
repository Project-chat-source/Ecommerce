import 'package:dartz/dartz.dart';
import 'package:learning/app/global/failure/failure.dart';
import 'package:learning/app/view/features/Home/domain/entities/product_response_entities.dart';
import 'package:learning/app/view/features/Home/domain/repositories/home_repositories.dart';

abstract class HomePageUsecases {
  Future<Either<Failure, ProductResponseEntities>> loadProducts();
}

class HomePageUsecasesImpl extends HomePageUsecases {
  final HomeRepositories homeRepositories;

  HomePageUsecasesImpl({required this.homeRepositories});

  @override
  Future<Either<Failure, ProductResponseEntities>> loadProducts() async {
    return await homeRepositories.loadProducts();
  }
}
