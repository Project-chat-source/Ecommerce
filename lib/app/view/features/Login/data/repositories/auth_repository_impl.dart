import 'package:dartz/dartz.dart';
import 'package:learning/app/global/failure/failure.dart';
import 'package:learning/app/global/localstorage/localstorage.dart';
import 'package:learning/app/view/features/Login/data/data%20source/login_data_source.dart';
import 'package:learning/app/view/features/Login/domain/entities/login_entity.dart';
import 'package:learning/app/view/features/Login/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LoginDataSource loginDataSource;
  final Localstorage localstorage;

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
        await localstorage.setValue('id', response.id);
        await localstorage.setValue('username', response.username);
        await localstorage.setValue('email', response.email);
        await localstorage.setValue('firstName', response.firstName);
        await localstorage.setValue('lastName', response.lastName);
        await localstorage.setValue('gender', response.gender);
        await localstorage.setValue('image', response.image);
        await localstorage.setValue('accessToken', response.accessToken);
        await localstorage.setValue('refreshToken', response.refreshToken);

        return Right(response.toDomain());
      } else {
        return Left(Failure(errorMessage: 'Login failed: Access token is empty'));
      }
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}
