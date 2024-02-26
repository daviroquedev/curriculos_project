import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../service/CandidatoService.dart';

part 'candidatos_store.g.dart';

class CandidatosStore = _CandidatosStore with _$CandidatosStore;

abstract class _CandidatosStore with Store {
  final CandidatoService candidatoService = Modular.get<CandidatoService>();

  @observable
  ObservableFuture<List<Map<String, dynamic>>> candidatosFuture =
      ObservableFuture.value([]);

  @computed
  List<Map<String, dynamic>> get candidatos =>
      candidatosFuture.value ?? <Map<String, dynamic>>[];

  @action
  void fetchCandidatos() {
    candidatosFuture = ObservableFuture(candidatoService.getCandidatos());
  }

  @action
  Future<void> atualizarStatusSolicitacao(
      int id, String status, BuildContext context) async {
    try {
      await candidatoService.atualizarStatusSolicitacao(id, status);
      fetchCandidatos(); // Atualiza a lista de candidatos após a chamada de API
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao atualizar o status do candidato'),
        ),
      );
    }
  }
}
