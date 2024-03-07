import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../controller/RegisterController.dart';
import '../store/register_store.dart';

class RegisterPage extends StatelessWidget {
  final RegisterController _controller = Modular.get<RegisterController>();
  final RegisterStore _registerStore = Modular.get<RegisterStore>();
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
      backgroundColor: const Color.fromARGB(255, 2, 95, 156),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Observer(
              builder: (_) => TextFormField(
                onChanged: _registerStore.setNome,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  labelStyle:
                      TextStyle(color: Colors.white), // Cor do texto branco
                ),
              ),
            ),
            Observer(
              builder: (_) => TextFormField(
                onChanged: _registerStore.setCpf,
                decoration: InputDecoration(
                  labelText: 'CPF',
                  labelStyle:
                      TextStyle(color: Colors.white), // Cor do texto branco
                ),
                inputFormatters: [cpfMaskFormatter],
              ),
            ),
            Observer(
              builder: (_) => TextFormField(
                onChanged: _registerStore.setDataNascimento,
                decoration: InputDecoration(
                  labelText: 'Data de Nascimento',
                  labelStyle:
                      TextStyle(color: Colors.white), // Cor do texto branco
                ),
                inputFormatters: [dateMaskFormatter],
              ),
            ),
            Observer(
              builder: (_) => TextFormField(
                onChanged: _registerStore.setEmail,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle:
                      TextStyle(color: Colors.white), // Cor do texto branco
                ),
              ),
            ),
            Observer(
              builder: (_) => TextFormField(
                onChanged: _registerStore.setTelefone,
                decoration: InputDecoration(
                  labelText: 'Telefone',
                  labelStyle:
                      TextStyle(color: Colors.white), // Cor do texto branco
                ),
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
                    child: Text(escolaridade,
                        style: TextStyle(
                            color: Colors.white)), // Cor do texto branco
                  );
                }).toList(),
                decoration: const InputDecoration(
                    labelText: 'Escolaridade',
                    labelStyle: TextStyle(color: Colors.white)),
              ),
            ),
            Observer(
              builder: (_) => TextFormField(
                onChanged: _registerStore.setFuncao,
                decoration: InputDecoration(
                  labelText: 'Função',
                  labelStyle:
                      TextStyle(color: Colors.white), // Cor do texto branco
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _competenciaController,
              decoration: InputDecoration(
                labelText: 'Competência',
                labelStyle:
                    TextStyle(color: Colors.white), // Cor do texto branco
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nivelController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Nível de Proficiência',
                labelStyle:
                    TextStyle(color: Colors.white), // Cor do texto branco
              ),
            ),
            Observer(
              builder: (_) => Column(
                children:
                    _registerStore.competencias.asMap().entries.map((entry) {
                  return ListTile(
                    title: Text(
                      '${entry.value.competencia} - Nível: ${entry.value.nivelProficiencia}',
                      style:
                          TextStyle(color: Colors.white), // Cor do texto branco
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _registerStore.competencias.removeAt(entry.key);
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 10),
            Observer(
              builder: (_) => ElevatedButton(
                onPressed: () {
                  _registerStore.addCompetencia(
                    competencia: _competenciaController.text,
                    nivelProficiencia: int.tryParse(_nivelController.text) ?? 0,
                  );
                  _competenciaController.clear();
                  _nivelController.clear();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Color.fromARGB(255, 52, 136, 132),
                ),
                child: const Text('Adicionar Competência',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 10),
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
                        'Erro durante o registro. Por favor, tente novamente.',
                      ),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Color.fromARGB(255, 2, 63, 0),
              ),
              child: const Text('Registrar',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
