import 'package:dio/dio.dart';
import 'package:learning/app/core/Networking/api_constants.dart';

class DioClient {
  late final Dio dio;

  DioClient(List<Interceptor> interceptors) {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.addAll(interceptors);
  }
}
