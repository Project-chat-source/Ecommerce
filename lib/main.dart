import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:learning/app/core/routes/app_route.dart';
import 'package:learning/app/global/secure%20storage/secure_storage.dart';
import 'package:learning/app/view/features/Home/data/data%20source/home_page_data_source.dart';
import 'package:learning/app/view/features/Home/data/repositories/home_repositories_impl.dart';
import 'package:learning/app/view/features/Home/domain/repositories/home_repositories.dart';
import 'package:learning/app/view/features/Home/domain/usecases/home_page_usecases.dart';
import 'package:learning/app/view/features/Home/ui/bloc/home_page_bloc.dart';
import 'package:learning/app/view/features/Login/data/data%20source/login_data_source.dart';
import 'package:learning/app/view/features/Login/data/repositories/auth_repository_impl.dart';
import 'package:learning/app/view/features/Login/domain/repositories/auth_repository.dart';
import 'package:learning/app/view/features/Login/domain/usecases/login_usecase.dart';
import 'package:learning/app/view/features/Login/ui/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';

final appRouter = AppRoute();
final getIt = GetIt.instance;

Future<void> setupLocator() async {
  final storage = const FlutterSecureStorage();

  getIt.registerLazySingleton<LoginDataSource>(() => LoginDataSourceImpl());
  getIt.registerLazySingleton(() => storage);
  getIt.registerLazySingleton<SecureStorage>(
    () => SecureStorage(storage: getIt<FlutterSecureStorage>()),
  );
  getIt.registerLazySingleton<HomePageDataSource>(
    () => HomePageDataSourceImpl(),
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(loginUseCase: getIt<LoginUseCase>()),
        ),
        BlocProvider(
          create: (context) =>
              HomePageBloc(homePageUsecases: getIt<HomePageUsecases>()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        routerConfig: appRouter.config(),
      ),
    );
  }
}
