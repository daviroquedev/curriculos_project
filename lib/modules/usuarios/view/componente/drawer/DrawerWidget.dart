import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../auth/service/AuthService.dart';

class DrawerWidget extends StatelessWidget {
  final String nome;
  final String email;
  final String statusSolicitacao;

  const DrawerWidget({
    Key? key,
    required this.nome,
    required this.email,
    required this.statusSolicitacao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color statusColor = Colors.white;
    switch (statusSolicitacao) {
      case 'APROVADO':
        statusColor = Colors.green;
        break;
      case 'REPROVADO':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.white;
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Nome: $nome',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Email: $email',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  statusSolicitacao,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('Perfil'),
            onTap: () {
              Modular.to.pushNamed("/user/perfil");
              // Implemente a navegação para a página de perfil
            },
          ),
          ListTile(
            title: const Text('Deslogar'),
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
