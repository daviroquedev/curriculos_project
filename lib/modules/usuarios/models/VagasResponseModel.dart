class VagaResponseModel {
  final int id;
  final String titulo;
  final String dataInicio;
  final String dataExpiracao;
  final String descricao;
  final double salario;
  final int totalDeCandidatosAplicado;
  bool candidatoJaCandidatou;

  VagaResponseModel(
      {required this.id,
      required this.titulo,
      required this.dataInicio,
      required this.dataExpiracao,
      required this.descricao,
      required this.salario,
      required this.totalDeCandidatosAplicado,
      this.candidatoJaCandidatou = false});

  factory VagaResponseModel.fromJson(Map<String, dynamic> json) {
    return VagaResponseModel(
      id: json['id'],
      titulo: json['tituloVaga'],
      dataInicio: json['dataInicio'],
      dataExpiracao: json['dataExpiracao'],
      descricao: json['descricaoVaga'],
      salario: json['salario'],
      totalDeCandidatosAplicado: json['totalDeCandidatosAplicado'],
      candidatoJaCandidatou: json['candidatoJaCandidatou'],
    );
  }
}
