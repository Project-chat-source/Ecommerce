import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:learning/app/core/routes/app_route.dart';
import 'package:learning/app/global/secure%20storage/secure_storage.dart';
import 'package:learning/main.dart';

class AuthGuard extends AutoRouteGuard {
  final SecureStorage localstorage = getIt<SecureStorage>();

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
