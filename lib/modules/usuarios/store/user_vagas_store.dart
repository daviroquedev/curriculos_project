import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../models/VagasResponseModel.dart';
import '../service/CandidatoService.dart';

part 'user_vagas_store.g.dart';

class UserVagasStore = _UserPageStore with _$UserVagasStore;

abstract class _UserPageStore with Store {
  final CandidatoService _candidatoService = Modular.get<CandidatoService>();

  @observable
  String nome = '';

  @observable
  String email = '';

  @observable
  String statusSolicitacao = '';

  @observable
  bool isLoading = true;

  @observable
  ObservableFuture<List<VagaResponseModel>> vagasFuture =
      ObservableFuture.value([]);

  @computed
  List<VagaResponseModel> get vagas => vagasFuture.value ?? [];

  @action
  Future<void> loadUserData() async {
    try {
      Map<String, dynamic> userData =
          await _candidatoService.getUsuarioLogado();
      nome = userData['nome'];
      email = userData['email'];
      statusSolicitacao = userData['statusSolicitacao'];
      isLoading = false;
    } catch (e) {
      print('Erro ao carregar os dados do usuário: $e');
      isLoading = false;
    }
  }

  @action
  Future<void> loadVagas() async {
    try {
      List<VagaResponseModel> vagas = await _candidatoService.getVagas();
      vagasFuture = ObservableFuture.value(vagas);
    } catch (e) {
      print('Erro ao carregar as vagas: $e');
    }
  }

  @action
  Future<void> candidatarVaga(int vagaId) async {
    try {
      await _candidatoService.candidatarVaga(vagaId);
      updateVagaState(vagaId); // Atualiza o estado da vaga após a candidatura
    } catch (e) {
      print('Erro ao se candidatar: $e');
    }
  }

  @action
  void updateVagaState(int vagaId) {
    final vaga = vagas.firstWhere((vaga) => vaga.id == vagaId);
    print('Estado da vaga antes da atualização: ${vaga.candidatoJaCandidatou}');
    vaga.candidatoJaCandidatou = true;
    print('Estado da vaga após a atualização: ${vaga.candidatoJaCandidatou}');
  }
}
