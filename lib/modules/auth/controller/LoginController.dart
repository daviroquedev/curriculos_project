import '../service/LoginService.dart';

class LoginController {
  final LoginService _loginService;

  LoginController(this._loginService);

  Future<String> login(String cpf) async {
    try {
      final token = await _loginService.login(cpf);
      return token;
    } catch (e) {
      throw Exception('Erro durante o login: $e');
    }
  }
}
