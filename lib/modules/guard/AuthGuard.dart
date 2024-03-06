import 'package:flutter_modular/flutter_modular.dart';

import '../auth/service/AuthService.dart';

class AuthGuard extends RouteGuard {
  final AuthService _authService = Modular.get<AuthService>();

  @override
  Future<bool> canActivate(String url, ModularRoute router) async {
    final role = await _authService.getRole();

    print("URL atual: $url");

    if (role == 'ADMIN') {
      print("ADMIN");

      return true;
    } else if (role == 'USER') {
      print("USER");

      return true;
    }
    // Se o papel não for definido ou não for válido, redirecionar para a página de login
    Modular.to.navigate('/login');
    return false;
  }
}
