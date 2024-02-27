import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../store/candidatos_store.dart';
import '../componente/graficos/EscolaridadeChart.dart';
import '../componente/graficos/SituacaoChart.dart';

class GraficosCandidatosPage extends StatelessWidget {
  final CandidatosStore candidatosStore = Modular.get<CandidatosStore>();

  @override
  Widget build(BuildContext context) {
    candidatosStore.fetchCandidatos();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gráficos de Candidatos'),
      ),
      body: Center(
        child: Observer(
          builder: (_) {
            if (candidatosStore.candidatosFuture.status ==
                FutureStatus.pending) {
              return const CircularProgressIndicator();
            } else if (candidatosStore.candidatosFuture.status ==
                FutureStatus.rejected) {
              return Text(
                  'Erro ao carregar os dados: ${candidatosStore.candidatosFuture.error}');
            } else {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    EscolaridadeChart(candidatos: candidatosStore.candidatos),
                    SizedBox(height: 20),
                    SituacaoChart(candidatos: candidatosStore.candidatos),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
