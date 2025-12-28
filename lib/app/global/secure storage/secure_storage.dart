import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:learning/app/view/features/Login/domain/entities/login_entity.dart';

class SecureStorage {
  final FlutterSecureStorage storage;

  SecureStorage({required this.storage});

  // Save
  Future<void> saveValue(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  // Read
  Future<String?> getValue(String key) async {
    return await storage.read(key: key);
  }

  // Delete single
  Future<void> removeValue(String key) async {
    await storage.delete(key: key);
  }

  // Delete all
  Future<void> removeAllValues() async {
    await storage.deleteAll();
  }

  // Save login session (BEST PRACTICE)
  Future<void> saveLoginSession(LoginEntity user) async {
    await saveValue('id', user.id.toString());
    await saveValue('username', user.username);
    await saveValue('email', user.email);
    await saveValue('firstName', user.firstName);
    await saveValue('lastName', user.lastName);
    await saveValue('gender', user.gender);
    await saveValue('image', user.image);
    await saveValue('accessToken', user.accessToken);
    await saveValue('refreshToken', user.refreshToken);
  }
}
