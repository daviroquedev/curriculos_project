import 'package:curriculos_project/modules/auth/model/RegisterFormDataModel.dart';
import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStore with _$RegisterStore;

abstract class _RegisterStore with Store {
  @observable
  String nome = '';

  @observable
  String cpf = '';

  @observable
  String dataNascimento = '';

  @observable
  String email = '';

  @observable
  String telefone = '';

  @observable
  String escolaridade = 'DEFAULT';

  @observable
  String funcao = '';

  @observable
  List<String> competencias = [];

  @action
  void setNome(String value) {
    nome = value;
  }

  @action
  void setCpf(String value) {
    cpf = value;
  }

  @action
  void setDataNascimento(String value) {
    dataNascimento = value;
  }

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setTelefone(String value) {
    telefone = value;
  }

  @action
  void setEscolaridade(String value) {
    escolaridade = value;
  }

  @action
  void setFuncao(String value) {
    funcao = value;
  }

  @action
  void setCompetencias(List<String> value) {
    competencias = value;
  }

  RegisterFormDataModel toFormDataModel() {
    return RegisterFormDataModel(
      nome: nome,
      cpf: cpf,
      dataNascimento: dataNascimento,
      email: email,
      telefone: telefone,
      escolaridade: escolaridade,
      funcao: funcao,
      competencias: List<String>.from(competencias),
    );
  }
}
