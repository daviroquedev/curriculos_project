import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import '../../../../uteis/translations/EscolaridadesTranslations.dart';
import '../../../store/candidatos_store.dart';
import '../../componente/CustomBottomAppBar.dart';

class CandidatoPage extends StatelessWidget {
  final CandidatosStore candidatosStore = Modular.get<CandidatosStore>();

  @override
  Widget build(BuildContext context) {
    candidatosStore.fetchCandidatos();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Candidatos'),
      ),
      body: Center(
        child: Observer(
          builder: (_) {
            if (candidatosStore.candidatosFuture.status ==
                FutureStatus.pending) {
              return const CircularProgressIndicator();
            } else if (candidatosStore.candidatosFuture.status ==
                FutureStatus.rejected) {
              return Text('Error: ${candidatosStore.candidatosFuture.error}');
            } else {
              // Organizar a lista de candidatos
              List<Map<String, dynamic>> candidatos =
                  candidatosStore.candidatos;
              candidatos.sort((a, b) {
                // Ordenar por status de solicitação: Pendente > Aprovado > Reprovado
                return _statusOrder(a['statusSolicitacao'])
                    .compareTo(_statusOrder(b['statusSolicitacao']));
              });
              return ListView.builder(
                itemCount: candidatos.length,
                itemBuilder: (context, index) {
                  final candidato = candidatos[index];
                  final statusSolicitacao = candidato['statusSolicitacao'];
                  final bool aprovado = statusSolicitacao == 'APROVADO';
                  final bool reprovado = statusSolicitacao == 'REPROVADO';
                  return Card(
                    child: ListTile(
                      title: GestureDetector(
                        onTap: () {
                          Modular.to.pushNamed(
                              '/user/admin/candidate_vagas/${candidato['id']}');
                        },
                        child: Text(
                          candidato['nome'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: aprovado
                                ? Colors.green
                                : reprovado
                                    ? Colors.red
                                    : Colors.black,
                          ),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Translations.escolaridadeOptions[
                                    candidato['escolaridade']] ??
                                candidato['escolaridade'],
                          ),
                          Text("${candidato['funcao']}"),
                          Text(
                            "${candidato['competencias'].entries.map((entry) => '${entry.key}: NV. ${entry.value}').join(' / ')}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Row(
                            children: [
                              const Text(
                                "Status: ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                candidato['statusSolicitacao'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: aprovado
                                      ? Colors.green
                                      : reprovado
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              await candidatosStore.atualizarStatusSolicitacao(
                                candidato['id'],
                                'APROVADO',
                                context,
                              );
                              Modular.to
                                  .pushReplacementNamed('/admin/candidate');
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 0, 139, 63),
                            ),
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () async {
                              await candidatosStore.atualizarStatusSolicitacao(
                                candidato['id'],
                                'REPROVADO',
                                context,
                              );
                              Modular.to
                                  .pushReplacementNamed('/admin/candidate');
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              backgroundColor: Colors.red,
                            ),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
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
      bottomNavigationBar: CustomBottomAppBar(
        onHomePressed: () {
          Modular.to.navigate("/user/admin");
        },
        onChartsPressed: () {
          Modular.to.pushNamed("candidate/charts");
        },
      ),
    );
  }

  int _statusOrder(String status) {
    switch (status) {
      case 'Pendente':
        return 0;
      case 'APROVADO':
        return 1;
      case 'REPROVADO':
        return 2;
      default:
        return 3;
    }
  }
}
