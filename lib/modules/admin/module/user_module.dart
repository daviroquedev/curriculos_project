import 'package:curriculos_project/modules/admin/view/candidatos/view/AdminHomePage.dart';

import 'package:curriculos_project/modules/guard/AuthGuard.dart';

import 'package:curriculos_project/modules/home/view/HomePage.dart';

import 'package:curriculos_project/modules/uteis/component/LoadingPage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../view/candidatos/service/CandidatoService.dart';
import '../view/candidatos/view/CandidatoPage.dart';

// responsavel pela rota e pela sistema de injeção de depedencias
class UserModule extends Module {
  // @override
  // List<Module> get imports => [AppModule()];

  @override
  void binds(i) {
    i.addSingleton(CandidatoService.new);
    i.addSingleton(FlutterSecureStorage.new);
  }

  @override
  void routes(r) {
    r.child("/", child: (context) => LoadingPage(), guards: [AuthGuard()]);

    r.child('/admin',
        child: (context) => AdminHomePage(), guards: [AuthGuard()]);
    r.child('/admin/candidate', child: (context) => CandidatoPage());
    r.child('/vagas', child: (context) => HomePage());
  }
}
