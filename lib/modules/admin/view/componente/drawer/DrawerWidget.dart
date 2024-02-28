import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../auth/service/AuthService.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Menu'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Perfil'),
            onTap: () {
              // Implementar navegação para a página de perfil
            },
          ),
          ListTile(
            title: Text('Deslogar'),
            onTap: () async {
              final AuthService authService = Modular.get<AuthService>();
              await authService.deleteToken(); // Excluir o token
              Modular.to
                  .navigate("/"); // Navegar de volta para a página inicial
            },
          ),
        ],
      ),
    );
  }
}
