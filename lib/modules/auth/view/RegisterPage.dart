import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../controller/RegisterController.dart';
import '../store/register_store.dart';

class RegisterPage extends StatelessWidget {
  final RegisterController _controller = Modular.get<RegisterController>();
  final RegisterStore _registerStore = RegisterStore();
  final TextEditingController _competenciaController = TextEditingController();
  final TextEditingController _nivelController = TextEditingController();

  final List<String> opcoesEscolaridade = [
    'FUNDAMENTAL',
    'MEDIO',
    'TECNICO',
    'SUPERIOR',
    'POS_GRADUACAO',
    'MESTRADO',
    'DEFAULT',
    'DOUTORADO',
  ];

  @override
  Widget build(BuildContext context) {
    var cpfMaskFormatter = MaskTextInputFormatter(
        mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});
    var dateMaskFormatter = MaskTextInputFormatter(
        mask: '##-##-####', filter: {"#": RegExp(r'[0-9]')});
    var phoneMaskFormatter = MaskTextInputFormatter(
        mask: '(##)#####-####', filter: {"#": RegExp(r'[0-9]')});

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Observer(
              builder: (_) => TextFormField(
                onChanged: _registerStore.setNome,
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
            ),
            Observer(
              builder: (_) => TextFormField(
                onChanged: _registerStore.setCpf,
                decoration: const InputDecoration(labelText: 'CPF'),
                inputFormatters: [cpfMaskFormatter],
              ),
            ),
            Observer(
              builder: (_) => TextFormField(
                onChanged: _registerStore.setDataNascimento,
                decoration:
                    const InputDecoration(labelText: 'Data de Nascimento'),
                inputFormatters: [dateMaskFormatter],
              ),
            ),
            Observer(
              builder: (_) => TextFormField(
                onChanged: _registerStore.setEmail,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
            ),
            Observer(
              builder: (_) => TextFormField(
                onChanged: _registerStore.setTelefone,
                decoration: const InputDecoration(labelText: 'Telefone'),
                inputFormatters: [phoneMaskFormatter],
              ),
            ),
            Observer(
              builder: (_) => DropdownButtonFormField(
                value: _registerStore.escolaridade != ''
                    ? _registerStore.escolaridade
                    : 'DEFAULT',
                onChanged: (newValue) {
                  _registerStore.setEscolaridade(newValue as String);
                },
                items: opcoesEscolaridade.map((escolaridade) {
                  return DropdownMenuItem(
                    value: escolaridade,
                    child: Text(escolaridade),
                  );
                }).toList(),
                decoration: const InputDecoration(labelText: 'Escolaridade'),
              ),
            ),
            Observer(
              builder: (_) => TextFormField(
                onChanged: _registerStore.setFuncao,
                decoration: const InputDecoration(labelText: 'Função'),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _competenciaController,
              decoration: const InputDecoration(labelText: 'Competência'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nivelController,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Nível de Proficiência'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _registerStore.addCompetencia(
                  competencia: _competenciaController.text,
                  nivelProficiencia: int.tryParse(_nivelController.text) ?? 0,
                );

                _competenciaController.clear();
                _nivelController.clear();
              },
              child: const Text('Adicionar Competência'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                bool success = await _controller
                    .register(_registerStore.toFormDataModel());
                if (success) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Sucesso'),
                      content: const Text('Registro realizado com sucesso!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Modular.to.pushNamed("/");
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Erro durante o registro. Por favor, tente novamente.'),
                    ),
                  );
                }
              },
              child: const Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
