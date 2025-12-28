import 'package:dartz/dartz.dart';
import 'package:learning/app/global/failure/failure.dart';
import 'package:learning/app/view/features/Login/domain/entities/login_entity.dart';
import 'package:learning/app/view/features/Login/domain/repositories/auth_repository.dart';

abstract class LoginUseCase{
  

  Future<Either<Failure, LoginEntity>> loginUser(final String username, final String password);
}


class LoginUseCaseImpl implements LoginUseCase {

  final AuthRepository authRepository ;

  LoginUseCaseImpl({required this.authRepository});
  
  @override
  Future<Either<Failure, LoginEntity>> loginUser(String username, String password) async{
    return await authRepository.loginUser(username, password);
  }
  
}
