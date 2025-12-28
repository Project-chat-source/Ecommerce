import 'package:learning/app/core/Networking/dio_client.dart';
import 'package:learning/app/view/features/Home/data/models/product_response_model.dart';

abstract class HomePageDataSource {
  Future<ProductResponseModel> loadProducts();
}

class HomePageDataSourceImpl implements HomePageDataSource {
  final DioClient dio;

  HomePageDataSourceImpl({required this.dio});

  @override
  Future<ProductResponseModel> loadProducts() async {
    try {
      final data = await dio.dio.getUri(Uri.parse('/products?limit=0'));

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
