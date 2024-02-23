import 'package:dio/dio.dart';

import '../model/RegisterFormDataModel.dart';

class RegisterService {
  final Dio dio;

  RegisterService(this.dio);

  Future<void> register(RegisterFormDataModel formData) async {
    try {
      List<String> dataSplit = formData.dataNascimento.split('-');
      String dataNascimentoFormatada =
          "${dataSplit[2]}-${dataSplit[1]}-${dataSplit[0]}";

      final response = await dio.post(
        'https://centralcurriculo.onrender.com/auth/register',
        data: {
          "nome": formData.nome,
          "cpf": formData.cpf,
          "dataNascimento": dataNascimentoFormatada,
          "email": formData.email,
          "telefone": formData.telefone,
          "escolaridade": formData.escolaridade,
          "funcao": formData.funcao,
          "listaCompetencias": formData.competencias,
          "statusSolicitacao": "Pendente",
          "role": "USER",
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Sucesso
        print("Registro realizado com sucesso!");
      } else {
        // Tratar erro
        print("Erro durante o registro: ${response.statusCode}");
      }
    } catch (e) {
      // Tratar erro
      print("Erro durante o registro: $e");
    }
  }
}
