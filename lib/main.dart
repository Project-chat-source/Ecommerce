import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/app/core/DI/setup_locator.dart';
import 'package:learning/app/core/routes/app_route.dart';
import 'package:learning/app/view/features/Home/domain/usecases/home_page_usecases.dart';
import 'package:learning/app/view/features/Home/ui/bloc/home_page_bloc.dart';
import 'package:learning/app/view/features/Login/domain/usecases/login_usecase.dart';
import 'package:learning/app/view/features/Login/ui/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';

final appRouter = AppRoute();
final getIt = GetIt.instance;

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
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        routerConfig: appRouter.config(),
      ),
    );
  }
}
