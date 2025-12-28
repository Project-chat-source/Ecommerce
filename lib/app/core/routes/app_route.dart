import 'package:auto_route/auto_route.dart';
import 'package:learning/app/core/guards/auth_guard.dart';
import 'package:learning/app/view/features/Home/ui/home_page.dart';
import 'package:learning/app/view/features/Login/ui/login_page.dart';
part 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRoute extends RootStackRouter {
  AppRoute();
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page, initial: true, path: '/'),

    AutoRoute(
      page: HomeRoute.page,
      path: '/home',
      children: [],
      guards: [AuthGuard()],
    ),
  ];
}
