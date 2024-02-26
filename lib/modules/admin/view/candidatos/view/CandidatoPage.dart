import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../service/CandidatoService.dart';

class CandidatoPage extends StatelessWidget {
  final CandidatoService candidatoService = Modular.get<CandidatoService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Candidatos'),
      ),
      body: Center(
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: candidatoService.getCandidatos(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<Map<String, dynamic>> candidatos = snapshot.data ?? [];
              return ListView.builder(
                itemCount: candidatos.length,
                itemBuilder: (context, index) {
                  final candidato = candidatos[index];
                  return Card(
                    child: ListTile(
                      title: Text(
                        candidato['nome'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Escolaridade: ${candidato['escolaridade']}"),
                          Text("Função: ${candidato['funcao']}"),
                          Text(
                              "Competências: ${candidato['listaCompetencias'].join(', ')}"),
                          Text(
                              "Status da Solicitação: ${candidato['statusSolicitacao']}"),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              await candidatoService.atualizarStatusSolicitacao(
                                candidato['id'],
                                'aprovado',
                                context,
                              );
                              // Atualize a lista de candidatos
                              // após a conclusão da chamada de API
                              Modular.to
                                  .pushReplacementNamed('/admin/candidate');
                            },
                            child: const Text('Aprovar'),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () async {
                              await candidatoService.atualizarStatusSolicitacao(
                                candidato['id'],
                                'reprovado',
                                context,
                              );
                              // Atualize a lista de candidatos
                              // após a conclusão da chamada de API
                              Modular.to
                                  .pushReplacementNamed('/admin/candidate');
                            },
                            child: const Text('Reprovar'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
