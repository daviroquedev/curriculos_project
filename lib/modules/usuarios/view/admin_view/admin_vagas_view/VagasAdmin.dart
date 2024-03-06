import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:curriculos_project/modules/usuarios/models/VagasResponseModel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../service/CandidatoService.dart';

class VagasAdmin extends StatelessWidget {
  final CandidatoService candidatoService =
      CandidatoService(FlutterSecureStorage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vagas Disponíveis'),
      ),
      body: Center(
        child: Observer(
          builder: (_) {
            return FutureBuilder<List<VagaResponseModel>>(
              future: candidatoService.getVagas(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<VagaResponseModel> vagas = snapshot.data ?? [];
                  return ListView.builder(
                    itemCount: vagas.length,
                    itemBuilder: (context, index) {
                      final vaga = vagas[index];
                      return ListTile(
                        title: Text(vaga.titulo),
                        subtitle: Text(vaga.descricao),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                // Adicione aqui a lógica para editar a vaga
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                // Adicione aqui a lógica para excluir a vaga
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
