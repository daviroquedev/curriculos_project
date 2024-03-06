import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../models/VagasResponseModel.dart';
import '../../service/CandidatoService.dart';
import '../componente/drawer/DrawerWidget.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final CandidatoService _candidatoService = Modular.get<CandidatoService>();

  late String _nome;
  late String _email;
  late String _statusSolicitacao;

  bool _isLoading = true;

  String formatarData(String data) {
    return '${data.substring(8, 10)}/${data.substring(5, 7)}/${data.substring(0, 4)}';
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      Map<String, dynamic> userData =
          await _candidatoService.getUsuarioLogado();

      setState(() {
        _nome = userData['nome'];
        _email = userData['email'];
        _statusSolicitacao = userData['statusSolicitacao'];
        _isLoading = false;
      });
    } catch (e) {
      print('Erro ao carregar os dados do usuário: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vagas Atuais'),
      ),
      drawer: _isLoading
          ? SizedBox()
          : DrawerWidget(
              nome: _nome,
              email: _email,
              statusSolicitacao: _statusSolicitacao,
            ),
      body: FutureBuilder<List<VagaResponseModel>>(
        future: _candidatoService.getVagas(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao carregar as vagas: ${snapshot.error}'),
            );
          } else {
            final List<VagaResponseModel> vagas = snapshot.data ?? [];
            return ListView.builder(
              itemCount: vagas.length,
              itemBuilder: (context, index) {
                final vaga = vagas[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    elevation: 4,
                    child: ListTile(
                      title: Text(vaga.titulo),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Inicio: ${formatarData(vaga.dataInicio)}'),
                          Text(
                              'Expiração: ${formatarData(vaga.dataExpiracao)}'),
                          Text('Descrição: ${vaga.descricao}'),
                          Text('Salário RS : ${vaga.salario}'),
                          Text(
                              'Nº Candidatos Aplicados: ${vaga.totalDeCandidatosAplicado}'),
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () async {
                          if (vaga.candidatoJaCandidatou) {
                            return;
                          }

                          try {
                            await _candidatoService.candidatarVaga(vaga.id);
                            setState(() {
                              vaga.candidatoJaCandidatou = true;
                            });
                          } catch (e) {
                            print('Erro ao se candidatar: $e');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              vaga.candidatoJaCandidatou ? Colors.grey : null,
                        ),
                        child: vaga.candidatoJaCandidatou
                            ? const Text('ALISTADO')
                            : const Text('CANDIDATAR'),
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
