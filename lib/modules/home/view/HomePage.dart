import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 2, 95, 156), // Cor de fundo da tela
      appBar: AppBar(
        title: const Text(
          'CENTRAL CURRÍCULO',
          style: TextStyle(color: Color.fromARGB(255, 36, 216, 248)),
        ), // Título do aplicativo
        centerTitle: true,
        elevation: 0, // Remove a sombra do appbar
        backgroundColor: const Color.fromARGB(255, 43, 54, 59), // Cor do appbar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/central_curriculo_logo.png', // Adicione seu logo aqui
              width: 150, // Largura do logo
              height: 150, // Altura do logo
            ),
            const SizedBox(height: 20), // Espaçamento entre o logo e o botão
            ElevatedButton(
              onPressed: () {
                // Navegar para a tela de login
                Modular.to.navigate("/auth/login");
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: const Color.fromARGB(
                    255, 43, 54, 59), // Cor de fundo do botão
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Borda arredondada
                ),
              ),
              child: const Text(
                'Entrar',
                style: TextStyle(fontSize: 18),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navegar para a tela de registro
                Modular.to.navigate("/auth/registro");
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Criar conta',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
