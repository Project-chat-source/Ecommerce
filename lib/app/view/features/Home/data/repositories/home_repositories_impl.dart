import 'package:dartz/dartz.dart';
import 'package:learning/app/global/failure/failure.dart';
import 'package:learning/app/view/features/Home/data/data%20source/home_page_data_source.dart';
import 'package:learning/app/view/features/Home/domain/entities/product_response_entities.dart';
import 'package:learning/app/view/features/Home/domain/repositories/home_repositories.dart';

class HomeRepositoriesImpl implements HomeRepositories {
  final HomePageDataSource homePageDataSource;

  HomeRepositoriesImpl({required this.homePageDataSource});

  @override
  Future<Either<Failure, ProductResponseEntities>> loadProducts() async {
    try {
      final response = await homePageDataSource.loadProducts();

      return Right(response.toDomain());
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}
