import 'package:curriculos_project/modules/auth/model/RegisterFormDataModel.dart';

import '../service/RegisterService.dart';

class RegisterController {
  final RegisterService _registerService;

  RegisterController(this._registerService);

  Future<bool> register(RegisterFormDataModel formData) async {
    try {
      await _registerService.register(formData);
      return true;
    } catch (e) {
      print("Erro durante o registro: $e");
      return false;
    }
  }
}
