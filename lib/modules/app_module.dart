import 'package:curriculos_project/modules/usuarios/module/user_module.dart';
import 'package:curriculos_project/modules/auth/interceptor/AuthInterceptor.dart';
import 'package:curriculos_project/modules/auth/module/auth_module.dart';
import 'package:curriculos_project/modules/auth/service/AuthService.dart';
import 'package:curriculos_project/modules/home/view/HomePage.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'usuarios/controller/CandidatoController.dart';
import 'guard/AuthGuard.dart';

// responsavel pela rota e pela sistema de injeção de depedencias
class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(AuthInterceptor.new);
    i.addSingleton(AuthService.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => HomePage());
    r.module('/auth/', module: AuthModule());
    r.module('/user/', module: UserModule(), guards: [AuthGuard()]);
  }
}
