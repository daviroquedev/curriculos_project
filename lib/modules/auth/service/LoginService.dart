import 'package:dio/dio.dart';

import '../model/LoginResponse.dart';

class LoginService {
  final Dio dio;

  LoginService(this.dio);

  Future<String> login(String cpf) async {
    try {
      final response = await dio.post(
        'https://centralcurriculo.onrender.com/auth/login',
        data: {
          "cpf": cpf,
        },
      );
      if (response.statusCode == 200) {
        final loginResponse = LoginResponse.fromJson(response.data);
        return loginResponse.token;
      } else {
        throw Exception('Falha no login');
      }
    } catch (e) {
      throw Exception('Erro durante o login2: $e');
    }
  }
}
