import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var currentUrl = Uri.base;
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
                Modular.to.pushNamed('admin/jobs');
              },
              child: Text('VER PAINEL DE VAGAS'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Modular.to.pushNamed('admin/candidate');
              },
              child: Text('CANDIDATOS'),
            ),
          ],
        ),
      ),
    );
  }
}
