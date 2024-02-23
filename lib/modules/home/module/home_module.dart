import 'package:curriculos_project/modules/app_module.dart';
import 'package:curriculos_project/modules/home/view/HomePage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

import '../../auth/view/RegisterPage.dart';

// responsavel pela rota e pela sistema de injeção de depedencias
class HomeModule extends Module {
  // List<Module> get imports => [AppModule()];

  // @override
  // void binds(i) {
  //   i.addInstance(Dio());
  // }

  // @override
  // void routes(r) {
  //   r.child('/registro', child: (context) => RegisterPage());
  // }
}
