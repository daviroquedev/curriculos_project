import 'package:curriculos_project/modules/auth/service/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../service/AuthService.dart';
import '../service/LoginService.dart';

class LoginPage extends StatelessWidget {
  final LoginService _loginService =
      Modular.get<LoginService>(); // Obtenha a instância do serviço de login
  final AuthService _authService = Modular.get<AuthService>();
  final TextEditingController _cpfController =
      TextEditingController(); // Controlador para o campo de texto do CPF

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller:
                  _cpfController, // Associe o controlador ao campo de texto do CPF
              decoration: InputDecoration(labelText: 'CPF'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  final cpf = _cpfController.text;
                  final token = await _loginService.login(cpf);
                  await AuthService().saveToken(token);

                  final role = await _authService.getRole();
                  if (role == 'ADMIN') {
                    Modular.to.navigate('/user/admin');
                  } else if (role == 'USER') {
                    Modular.to.navigate('/user/candidate');
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Erro durante o login: $e'),
                    ),
                  );
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
