import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final _storage = const FlutterSecureStorage();

  Future<void> saveToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: 'token');
  }

  Future<String?> getRole() async {
    final token = await getToken();
    if (token != null) {
      final decodedToken =
          json.decode(utf8.decode(base64Url.decode(token.split('.')[1])));
      return decodedToken['role'];
    }
    return null;
  }
}
