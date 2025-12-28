import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:learning/app/core/routes/app_route.dart';
import 'package:learning/app/global/localstorage/localstorage.dart';
import 'package:learning/main.dart';

class AuthGuard extends AutoRouteGuard {
  final Localstorage localstorage = getIt<Localstorage>();

  @override
  FutureOr<void> onNavigation(NavigationResolver resolver, StackRouter router) async{

    final token = await localstorage.getValue('accessToken'); 
    if ( token != null) {
      resolver.next();
    } else {
      router.navigate(LoginRoute());
    }
  }
}
