import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var currentUrl = Uri.base; // Mova esta linha para cá
    print('URL atual: $currentUrl');

    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Modular.to.navigate('admin/jobs');
                // Navegar para a página de vagas
                // Navigator.pushNamed(context, 'user/jobs');
              },
              child: Text('VER PAINEL DE VAGAS'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Modular.to.navigate('admin/candidate');
              },
              child: Text('CANDIDATOS'),
            ),
          ],
        ),
      ),
    );
  }
}
