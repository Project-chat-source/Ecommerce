import 'package:dartz/dartz.dart';
import 'package:learning/app/global/failure/failure.dart';
import 'package:learning/app/global/secure%20storage/secure_storage.dart';
import 'package:learning/app/view/features/Login/data/data%20source/login_data_source.dart';
import 'package:learning/app/view/features/Login/domain/entities/login_entity.dart';
import 'package:learning/app/view/features/Login/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LoginDataSource loginDataSource;
  final SecureStorage localstorage;

  AuthRepositoryImpl({
    required this.loginDataSource,
    required this.localstorage,
  });

  @override
  Future<Either<Failure, LoginEntity>> loginUser(
    String username,
    String password,
  ) async {
    try {
      final response = await loginDataSource.loginUsers(username, password);

      if (response.accessToken.isNotEmpty) {
        await localstorage.saveLoginSession(response.toDomain());

        return Right(response.toDomain());
      } else {
        return Left(
          Failure(errorMessage: 'Login failed: Access token is empty'),
        );
      }
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}
