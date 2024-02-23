import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../controller/RegisterController.dart';
import '../store/register_store.dart';

class RegisterPage extends StatelessWidget {
  final RegisterController _controller = Modular.get<RegisterController>();
  final RegisterStore _registerStore = RegisterStore();
  final TextEditingController _competenciasController = TextEditingController();

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
                inputFormatters: [
                  cpfMaskFormatter
                ], // Adicione a máscara ao campo CPF
              ),
            ),
            Observer(
              builder: (_) => TextFormField(
                onChanged: _registerStore.setDataNascimento,
                decoration:
                    const InputDecoration(labelText: 'Data de Nascimento'),
                inputFormatters: [
                  dateMaskFormatter
                ], // Adicione a máscara ao campo de data de nascimento
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
            TextFormField(
              controller: _competenciasController,
              onChanged: (value) {
                _registerStore.setCompetencias(
                    value.split(',').map((e) => e.trim()).toList());
              },
              decoration: const InputDecoration(
                  labelText: 'Competências (separadas por vírgula)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                bool success = await _controller
                    .register(_registerStore.toFormDataModel());
                if (success) {
                  // Se o registro for bem-sucedido, exiba um modal de sucesso
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Sucesso'),
                      content: const Text('Registro realizado com sucesso!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Fechar o modal e voltar para a tela de login
                            Modular.to.pop("/login");
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else {
                  // Se o registro falhar, exiba uma mensagem de erro
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
