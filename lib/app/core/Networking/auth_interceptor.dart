import 'package:dio/dio.dart';
import 'package:learning/app/global/secure%20storage/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorage storage;

  AuthInterceptor({required this.storage});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await storage.getValue('accessToken');

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}
