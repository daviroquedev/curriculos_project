import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../store/candidatos_store.dart';

class UserPerfilPage extends StatefulWidget {
  @override
  _UserPerfilPageState createState() => _UserPerfilPageState();
}

class _UserPerfilPageState extends State<UserPerfilPage> {
  final CandidatosStore _candidatosStore = Modular.get<CandidatosStore>();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      await _candidatosStore.getUsuarioLogado();
    } catch (e) {
      print('Erro ao carregar os dados do usuário: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do Usuário'),
      ),
      body: Observer(
        builder: (_) {
          if (_candidatosStore.nome.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return _buildForm();
          }
        },
      ),
    );
  }

  Widget _buildForm() {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        Observer(
          builder: (_) => TextFormField(
            onChanged: _candidatosStore.setNome,
            initialValue: _candidatosStore.nome,
            decoration: InputDecoration(labelText: 'Nome'),
          ),
        ),
        Observer(
          builder: (_) => TextFormField(
            onChanged: _candidatosStore.setCpf,
            initialValue: _candidatosStore.cpf,
            decoration: InputDecoration(labelText: 'CPF'),
          ),
        ),
        Observer(
          builder: (_) => TextFormField(
            onChanged: _candidatosStore.setDataNascimento,
            initialValue: _candidatosStore.dataNascimento,
            decoration: InputDecoration(labelText: 'Data de Nascimento'),
          ),
        ),
        Observer(
          builder: (_) => TextFormField(
            onChanged: _candidatosStore.setEmail,
            initialValue: _candidatosStore.email,
            decoration: InputDecoration(labelText: 'Email'),
          ),
        ),
        Observer(
          builder: (_) => TextFormField(
            onChanged: _candidatosStore.setTelefone,
            initialValue: _candidatosStore.telefone,
            decoration: InputDecoration(labelText: 'Telefone'),
          ),
        ),
        Observer(
          builder: (_) => TextFormField(
            onChanged: _candidatosStore.setEscolaridade,
            initialValue: _candidatosStore.escolaridade,
            decoration: InputDecoration(labelText: 'Escolaridade'),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _salvar,
          child: Text('Salvar'),
        ),
      ],
    );
  }

  void _salvar() async {
    try {
      // Crie um novo mapa com os dados atualizados
      Map<String, dynamic> userData = {
        'nome': _candidatosStore.nome,
        'cpf': _candidatosStore.cpf,
        'dataNascimento': _candidatosStore.dataNascimento,
        'email': _candidatosStore.email,
        'telefone': _candidatosStore.telefone,
        'escolaridade': _candidatosStore.escolaridade,
      };
      // Chame o método de atualização do store passando os dados
      await _candidatosStore.atualizarUsuarioLogado(userData);
      // Mostre uma mensagem de sucesso ao usuário
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Dados atualizados com sucesso'),
        ),
      );
    } catch (e) {
      // Em caso de erro, mostre uma mensagem de erro ao usuário
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao atualizar os dados do usuário: $e'),
        ),
      );
    }
  }
}
