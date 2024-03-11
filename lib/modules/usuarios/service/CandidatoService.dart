import 'package:curriculos_project/modules/usuarios/models/VagasResponseModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../auth/interceptor/AuthInterceptor.dart';

class CandidatoService {
  final Dio _dio = Dio();

  CandidatoService(FlutterSecureStorage storage) {
    _dio.interceptors
        .add(AuthInterceptor(storage)); // Adicione o interceptor aqui
  }

  // admin
  Future<List<Map<String, dynamic>>> getCandidatos() async {
    try {
      final response =
          await _dio.get('https://centralcurriculo.onrender.com/candidatos');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return List<Map<String, dynamic>>.from(response.data);
      } else {
        throw Exception('Failed to load candidatos');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }

  // admin
  Future<void> atualizarStatusSolicitacao(int id, String status,
      [BuildContext? context]) async {
    try {
      final response = await _dio.put(
        'https://centralcurriculo.onrender.com/candidatos/$id/gerenciarSolicitacao',
        queryParameters: {'status': status},
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to update status');
      }
    } catch (e) {
      throw Exception('Failed to update status');
    }
  }

  // admin ou user
  Future<List<VagaResponseModel>> getVagas() async {
    try {
      final response =
          await _dio.get('https://centralcurriculo.onrender.com/vagas');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> responseData = response.data;
        List<VagaResponseModel> vagas = responseData
            .map((data) => VagaResponseModel.fromJson(data))
            .toList();
        return vagas;
      } else {
        throw Exception('Failed to load vagas');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }

  Future<void> candidatarVaga(int vagaId) async {
    try {
      final response = await _dio.post(
        'https://centralcurriculo.onrender.com/vagas/$vagaId/candidatar',
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to apply for job');
      }
    } catch (e) {
      throw Exception('Failed to apply for job!!');
    }
  }

  Future<List<VagaResponseModel>> getCandidatoVagas(int userId) async {
    try {
      final response = await _dio
          .get('https://centralcurriculo.onrender.com/vagas/candidato/$userId');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> responseData = response.data;
        List<VagaResponseModel> vagas = responseData
            .map((data) => VagaResponseModel.fromJson(data))
            .toList();
        return vagas;
      } else {
        throw Exception('Failed to load vagas');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }

  Future<Map<String, dynamic>> getUsuarioLogado() async {
    try {
      final response =
          await _dio.get('https://centralcurriculo.onrender.com/candidatos/me');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Map<String, dynamic>.from(response.data);
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }

  Future<void> atualizarUsuarioLogado(Map<String, dynamic> userData) async {
    try {
      final response = await _dio.put(
        'https://centralcurriculo.onrender.com/candidatos/me',
        data: userData,
      );
      if (response.statusCode != 200 || response.statusCode != 201) {
        throw Exception('Failed to update user data');
      }
    } catch (e) {
      throw Exception('Failed to update user data');
    }
  }
}
