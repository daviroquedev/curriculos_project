// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';

// import '../service/CandidatoService.dart';

// class CandidatoController extends StatelessWidget {
//   final CandidatoService candidatoService = Modular.get<CandidatoService>();
//   late Future<List<Map<String, dynamic>>> futureCandidatos;

//   CandidatoController(
//     Key? key,
//     this.futureCandidatos,
//   ) {
//     futureCandidatos = candidatoService.getCandidatos();
//   }

//   Future<void> handleStatusChange(
//       int id, String status, BuildContext context) async {
//     try {
//       // Desabilite os botões enquanto a chamada de API estiver em andamento
//       // Pode ser feito através de um estado no widget ou de outra forma desejada
//       // Implemente a lógica para atualizar o status do candidato
//       await candidatoService.atualizarStatusSolicitacao(id, status);
//       // Atualize a lista de candidatos após a conclusão da chamada de API
//       futureCandidatos = candidatoService.getCandidatos();
//     } catch (e) {
//       // Trate qualquer erro que possa ocorrer durante a chamada de API
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Erro ao atualizar o status do candidato'),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
