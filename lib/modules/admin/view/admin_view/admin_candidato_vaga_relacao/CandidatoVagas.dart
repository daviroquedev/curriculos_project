import 'package:flutter/material.dart';
import 'package:curriculos_project/modules/admin/models/VagasResponseModel.dart';
import 'package:curriculos_project/modules/admin/service/CandidatoService.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CandidatoVagas extends StatefulWidget {
  final int userId;

  const CandidatoVagas({Key? key, required this.userId}) : super(key: key);

  @override
  _CandidatoVagasState createState() => _CandidatoVagasState();
}

class _CandidatoVagasState extends State<CandidatoVagas> {
  late Future<List<VagaResponseModel>> _vagasFuture;

  @override
  void initState() {
    super.initState();
    const storage = FlutterSecureStorage();
    _vagasFuture = CandidatoService(storage).getCandidatoVagas(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vagas Registradas'),
      ),
      body: FutureBuilder<List<VagaResponseModel>>(
        future: _vagasFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<VagaResponseModel>? vagas = snapshot.data;
            if (vagas == null || vagas.isEmpty) {
              return Center(child: Text('Nenhuma vaga registrada.'));
            } else {
              return ListView.builder(
                itemCount: vagas.length,
                itemBuilder: (context, index) {
                  final vaga = vagas[index];
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            vaga.titulo,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            vaga.descricao,
                            style: TextStyle(fontSize: 16),
                          ),
                          // Adicione mais informações da vaga conforme necessário
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
