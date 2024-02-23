import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../service/CandidatoService.dart';

class CandidatoPage extends StatefulWidget {
  @override
  _CandidatoPageState createState() => _CandidatoPageState();
}

class _CandidatoPageState extends State<CandidatoPage> {
  final CandidatoService candidatoService = Modular.get<CandidatoService>();
  late Future<List<Map<String, dynamic>>> futureCandidatos;

  @override
  void initState() {
    super.initState();
    futureCandidatos = candidatoService.getCandidatos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Candidatos'),
      ),
      body: Center(
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: futureCandidatos,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final candidato = snapshot.data![index];
                  return ListTile(
                    title: Text(candidato['nome']),
                    subtitle: Text(candidato['cpf']),
                    onTap: () {
                      // Implementar ação ao clicar no candidato
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
