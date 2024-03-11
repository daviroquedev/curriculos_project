import 'package:curriculos_project/modules/usuarios/models/VagasResponseModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../service/CandidatoService.dart';

part 'candidatos_store.g.dart';

class CandidatosStore = _CandidatosStore with _$CandidatosStore;

abstract class _CandidatosStore with Store {
  final CandidatoService candidatoService = Modular.get<CandidatoService>();

  @observable
  String nome = '';

  @action
  void setNome(String value) => nome = value;

  @observable
  String cpf = '';

  @action
  void setCpf(String value) => cpf = value;

  @observable
  String dataNascimento = '';

  @action
  void setDataNascimento(String value) => dataNascimento = value;

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @observable
  String telefone = '';

  @action
  void setTelefone(String value) => telefone = value;

  @observable
  String escolaridade = '';

  @action
  void setEscolaridade(String value) => escolaridade = value;

  @observable
  Map<String, dynamic> competencias = {};

  @action
  void setCompetencias(Map<String, dynamic> value) => competencias = value;

  @observable
  String statusSolicitacao = '';

  @action
  void setStatusSolicitacao(String value) => statusSolicitacao = value;

  @observable
  String role = '';

  @action
  void setRole(String value) => role = value;

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

  Future<void> atualizarStatusSolicitacao(
      int id, String status, BuildContext context) async {
    try {
      await candidatoService.atualizarStatusSolicitacao(id, status);
      fetchCandidatos();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao atualizar o status do candidato'),
        ),
      );
    }
  }

  @action
  Future<void> getUsuarioLogado() async {
    try {
      final userData = await candidatoService.getUsuarioLogado();

      setNome(userData['nome']);
      setCpf(userData['cpf']);
      setDataNascimento(userData['dataNascimento']);
      setEmail(userData['email']);
      setTelefone(userData['telefone']);
      setEscolaridade(userData['escolaridade']);
      setCompetencias(userData['competencias']);
      setStatusSolicitacao(userData['statusSolicitacao']);
      setRole(userData['role']);
    } catch (e) {
      throw Exception('Erro ao obter os dados do usuário logado: $e');
    }
  }

  @action
  Future<void> atualizarUsuarioLogado(Map<String, dynamic> userData) async {
    try {
      await candidatoService.atualizarUsuarioLogado(userData);

      await getUsuarioLogado();
    } catch (e) {
      throw Exception('Erro ao atualizar os dados do usuário: $e');
    }
  }
}
