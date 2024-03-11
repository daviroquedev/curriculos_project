import 'package:curriculos_project/modules/auth/model/Competencia.dart';

class RegisterFormDataModel {
  String nome;
  String cpf;
  String dataNascimento;
  String email;
  String telefone;
  String escolaridade;
  String funcao;
  List<Competencia> competencias;

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

  Map<String, dynamic> toJson() {
    final competenciasPreenchidas =
        competencias.where((c) => c.competencia.isNotEmpty).toList();

    return {
      'nome': nome,
      'cpf': cpf,
      'dataNascimento': dataNascimento,
      'email': email,
      'telefone': telefone,
      'escolaridade': escolaridade,
      'funcao': funcao,
      'competencias': competenciasPreenchidas.map((c) => c.toJson()).toList(),
    };
  }
}
