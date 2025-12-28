import 'package:dio/dio.dart';
import 'package:learning/app/view/features/Home/data/models/product_response_model.dart';

final Dio dio = Dio(
  BaseOptions(
    baseUrl: 'https://dummyjson.com',
    connectTimeout: Duration(seconds: 5),
    sendTimeout: Duration(seconds: 5),
    headers: {
      'Content-Type': 'application/json',
    },
    receiveTimeout: Duration(seconds: 5)
    
  )
);

abstract class HomePageDataSource {
  Future<ProductResponseModel> loadProducts();
}

class HomePageDataSourceImpl implements HomePageDataSource {
  @override
  Future<ProductResponseModel> loadProducts() async {
    try {
      final data = await dio.getUri(
        Uri.parse('/products?limit=0'),
      );

      if (data.statusCode == 200) {
        return ProductResponseModel.fromJson(data.data);
      } else {
        throw Exception(data.data['message'] ?? 'failed to load products');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
