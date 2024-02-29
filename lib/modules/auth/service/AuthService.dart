import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthService {
  final _storage = const FlutterSecureStorage();

  Future<void> saveToken(String token) async {
    await _storage.write(key: 'token', value: token);
    print("TOKEN SALVO: " + token);
  }

  Future<String?> getToken() async {
    print("GET TOKEN: ");
    return await _storage.read(key: 'token');
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: 'token');
  }

  Future<String?> getRole() async {
    try {
      final token = await getToken();
      if (token != null) {
        Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
        return decodedToken['role'];
      } else {
        return null;
      }
    } catch (e) {
      print('Erro ao obter a role do token: $e');
      return null;
    }
  }
}
