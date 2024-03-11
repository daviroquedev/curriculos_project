import 'package:curriculos_project/modules/uteis/formats/FormatadoresUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../models/VagasResponseModel.dart';
import '../../store/user_vagas_store.dart';
import '../componente/drawer/DrawerWidget.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final UserVagasStore _store = Modular.get<UserVagasStore>();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await _store.loadUserData();
    await _store.loadVagas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vagas Atuais'),
      ),
      drawer: Observer(
        builder: (_) {
          if (_store.isLoading) {
            return SizedBox();
          } else {
            return DrawerWidget(
              nome: _store.nome,
              email: _store.email,
              statusSolicitacao: _store.statusSolicitacao,
            );
          }
        },
      ),
      body: Observer(
        builder: (_) {
          final vagas = _store.vagas;
          if (_store.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: vagas.length,
              itemBuilder: (context, index) {
                final vaga = vagas[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: Card(
                    elevation: 4,
                    child: ListTile(
                      title: Text(vaga.titulo),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Inicio: ${FormatadoresUtils.formatarData(vaga.dataInicio)}',
                          ),
                          Text(
                            'Expiração: ${FormatadoresUtils.formatarData(vaga.dataExpiracao)}',
                          ),
                          Text('Descrição: ${vaga.descricao}'),
                          Text('Salário RS : ${vaga.salario}'),
                          Text(
                            'Nº Candidatos Aplicados: ${vaga.totalDeCandidatosAplicado}',
                          ),
                        ],
                      ),
                      trailing: Observer(
                        builder: (_) {
                          return ElevatedButton(
                            onPressed: () async {
                              if (vaga.candidatoJaCandidatou) {
                                return;
                              }
                              await _store.candidatarVaga(
                                vaga.id,
                              );

                              await _store.loadVagas();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: vaga.candidatoJaCandidatou
                                  ? Colors.grey
                                  : null,
                            ),
                            child: vaga.candidatoJaCandidatou
                                ? const Text('ALISTADO')
                                : const Text('CANDIDATAR'),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
