class RegisterFormDataModel {
  String nome;
  String cpf;
  String dataNascimento;
  String email;
  String telefone;
  String escolaridade;
  String funcao;
  List<String> competencias;

  RegisterFormDataModel({
    this.nome = '',
    this.cpf = '',
    this.dataNascimento = '',
    this.email = '',
    this.telefone = '',
    this.escolaridade = '',
    this.funcao = '',
    this.competencias = const [],
  });
}
