import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../auth/interceptor/AuthInterceptor.dart';

class CandidatoService {
  final Dio _dio = Dio();

  CandidatoService(FlutterSecureStorage storage) {
    _dio.interceptors
        .add(AuthInterceptor(storage)); // Adicione o interceptor aqui
  }

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
}
