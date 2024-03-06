import 'package:curriculos_project/modules/auth/service/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../service/LoginService.dart';

class LoginPage extends StatelessWidget {
  final LoginService _loginService = Modular.get<LoginService>();
  final AuthService _authService = Modular.get<AuthService>();
  final TextEditingController _cpfController = TextEditingController();
  final MaskTextInputFormatter _cpfFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});

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
              controller: _cpfController,
              decoration: InputDecoration(labelText: 'CPF'),
              inputFormatters: [_cpfFormatter],
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  final cpf = _cpfController.text;
                  final token = await _loginService.login(cpf);

                  print("token $token");

                  await AuthService().saveToken(token);

                  final role = await _authService.getRole();
                  print("ROLEEEE $role");
                  if (role == 'ADMIN') {
                    Modular.to.pushNamed('/user/admin');
                  } else if (role == 'USER') {
                    Modular.to.navigate('/user/user');
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Erro durante o login3: $e'),
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
