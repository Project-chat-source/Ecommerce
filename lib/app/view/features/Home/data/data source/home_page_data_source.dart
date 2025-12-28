import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learning/app/view/features/Home/data/models/product_response_model.dart';

abstract class HomePageDataSource {
  Future<ProductResponseModel> loadProducts();
}

class HomePageDataSourceImpl implements HomePageDataSource {
  @override
  Future<ProductResponseModel> loadProducts() async {
    try {
      final data = await http.get(Uri.parse('https://dummyjson.com/products'));

      if (data.statusCode == 200) {
        final response = jsonDecode(data.body) as Map<String , dynamic>;

        return ProductResponseModel.fromJson(response);
      } else {
        final response = jsonDecode(data.body);
        throw Exception(response['message'] ?? 'failed to load products');
      }
    } catch (e) {
      print('error from datasource $e');
      throw Exception(e.toString());
    }
  }
}
