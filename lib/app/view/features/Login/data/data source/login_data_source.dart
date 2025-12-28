import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learning/app/view/features/Login/data/models/login_model.dart';

abstract class LoginDataSource {
  Future<LoginModel> loginUsers(final String username, final String password);
}

class LoginDataSourceImpl extends LoginDataSource {
  @override
  Future<LoginModel> loginUsers(String username, String password) async {
    try {
      final data = await http.post(
        Uri.parse('https://dummyjson.com/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );

      print('executing this success bloc ${data.statusCode} ');
      if (data.statusCode == 200) {
        final response = jsonDecode(data.body);

        return LoginModel.fromJson(response);
      } else {

        final response = jsonDecode(data.body);
        final errorMessage = response['message'] ?? 'Login failed with ${data.statusCode}';
        
        throw Exception(errorMessage);
      }
    } catch (e) {

      print('executing this catch block $e');
      throw Exception('An error occured ${e.toString()}');
    }
  }
}
