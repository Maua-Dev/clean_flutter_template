import 'package:clean_flutter_template/shared/infra/storage/secure_storage_interface.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SecureStorage implements ISecureStorage {
  final Box storage;

  SecureStorage._(this.storage);

  static Future<SecureStorage> instance() async {
    await Hive.initFlutter();
    return SecureStorage._(await Hive.openBox('box'));
  }

  @override
  Future<String> getRefreshToken() async {
    return await storage.get('refreshToken');
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    await storage.put('refreshToken', token);
  }
}
