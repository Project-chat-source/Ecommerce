import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:learning/app/core/Networking/auth_interceptor.dart';
import 'package:learning/app/core/Networking/dio_client.dart';
import 'package:learning/app/global/secure%20storage/secure_storage.dart';
import 'package:learning/app/view/features/Home/data/data%20source/home_page_data_source.dart';
import 'package:learning/app/view/features/Home/data/repositories/home_repositories_impl.dart';
import 'package:learning/app/view/features/Home/domain/repositories/home_repositories.dart';
import 'package:learning/app/view/features/Home/domain/usecases/home_page_usecases.dart';
import 'package:learning/app/view/features/Login/data/data%20source/login_data_source.dart';
import 'package:learning/app/view/features/Login/data/repositories/auth_repository_impl.dart';
import 'package:learning/app/view/features/Login/domain/repositories/auth_repository.dart';
import 'package:learning/app/view/features/Login/domain/usecases/login_usecase.dart';
import 'package:learning/main.dart';

Future<void> setupLocator() async {
  final storage = const FlutterSecureStorage();

  getIt.registerLazySingleton<LoginDataSource>(() => LoginDataSourceImpl());
  getIt.registerLazySingleton(() => storage);
  getIt.registerLazySingleton<SecureStorage>(
    () => SecureStorage(storage: getIt<FlutterSecureStorage>()),
  );
  getIt.registerLazySingleton<AuthInterceptor>(
    () => AuthInterceptor(storage: getIt<SecureStorage>()),
  );
  getIt.registerLazySingleton<DioClient>(
    () => DioClient([getIt<AuthInterceptor>()]),
  );
  getIt.registerLazySingleton<HomePageDataSource>(
    () => HomePageDataSourceImpl(dio: getIt<DioClient>()),
  );
  getIt.registerLazySingleton<HomeRepositories>(
    () => HomeRepositoriesImpl(homePageDataSource: getIt<HomePageDataSource>()),
  );
  getIt.registerLazySingleton<HomePageUsecases>(
    () => HomePageUsecasesImpl(homeRepositories: getIt<HomeRepositories>()),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      loginDataSource: getIt<LoginDataSource>(),
      localstorage: getIt<SecureStorage>(),
    ),
  );
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCaseImpl(authRepository: getIt<AuthRepository>()),
  );
}
