import 'package:curriculos_project/modules/admin/controller/CandidatoController.dart';
import 'package:curriculos_project/modules/admin/view/admin_view/AdminHomePage.dart';
import 'package:curriculos_project/modules/admin/view/admin_view/admin_candidatos_view/GraficosCandidatosPage.dart';
import 'package:curriculos_project/modules/admin/view/simple_user_view/UserPage.dart';

import 'package:curriculos_project/modules/guard/AuthGuard.dart';

import 'package:curriculos_project/modules/home/view/HomePage.dart';

import 'package:curriculos_project/modules/uteis/component/LoadingPage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../service/CandidatoService.dart';
import '../store/candidatos_store.dart';
import '../view/admin_view/admin_candidatos_view/CandidatoPage.dart';

// responsavel pela rota e pela sistema de injeção de depedencias
class UserModule extends Module {
  // @override
  // List<Module> get imports => [AppModule()];

  @override
  void binds(i) {
    i.addSingleton(CandidatoService.new);
    i.addSingleton(FlutterSecureStorage.new);
    i.addSingleton(CandidatosStore.new);
  }

  @override
  void routes(r) {
    r.child("/", child: (context) => LoadingPage(), guards: [AuthGuard()]);

    r.child('/admin',
        child: (context) => AdminHomePage(), guards: [AuthGuard()]);
    r.child('/user', child: (context) => UserPage(), guards: [AuthGuard()]);
    r.child('/admin/candidate', child: (context) => CandidatoPage());
    r.child('/admin/candidate/charts',
        child: (context) => GraficosCandidatosPage());
    r.child('/vagas', child: (context) => HomePage());
  }
}
