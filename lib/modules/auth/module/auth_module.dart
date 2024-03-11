import 'package:curriculos_project/modules/usuarios/module/user_module.dart';
import 'package:curriculos_project/modules/auth/controller/RegisterController.dart';
import 'package:curriculos_project/modules/auth/service/AuthService.dart';
import 'package:curriculos_project/modules/auth/service/LoginService.dart';

import 'package:curriculos_project/modules/auth/service/RegisterService.dart';
import 'package:curriculos_project/modules/auth/view/LoginPage.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../usuarios/controller/CandidatoController.dart';
import '../../auth/view/RegisterPage.dart';
import '../store/register_store.dart';

class AuthModule extends Module {
  // List<Module> get imports => [AppModule()];

  @override
  void binds(i) {
    i.addInstance(Dio());
    i.addSingleton(RegisterService.new);
    i.addSingleton(RegisterController.new);
    i.addSingleton(RegisterStore.new);
    i.addSingleton(LoginService.new);
    i.addSingleton(FlutterSecureStorage.new);
    i.addSingleton(AuthService.new);
  }

  @override
  void routes(r) {
    r.child('/registro', child: (context) => RegisterPage());
    r.child('/login', child: (context) => LoginPage());
  }
}
