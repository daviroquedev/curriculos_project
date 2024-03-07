// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterStore on _RegisterStore, Store {
  late final _$nomeAtom = Atom(name: '_RegisterStore.nome', context: context);

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$cpfAtom = Atom(name: '_RegisterStore.cpf', context: context);

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  late final _$dataNascimentoAtom =
      Atom(name: '_RegisterStore.dataNascimento', context: context);

  @override
  String get dataNascimento {
    _$dataNascimentoAtom.reportRead();
    return super.dataNascimento;
  }

  @override
  set dataNascimento(String value) {
    _$dataNascimentoAtom.reportWrite(value, super.dataNascimento, () {
      super.dataNascimento = value;
    });
  }

  late final _$emailAtom = Atom(name: '_RegisterStore.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$telefoneAtom =
      Atom(name: '_RegisterStore.telefone', context: context);

  @override
  String get telefone {
    _$telefoneAtom.reportRead();
    return super.telefone;
  }

  @override
  set telefone(String value) {
    _$telefoneAtom.reportWrite(value, super.telefone, () {
      super.telefone = value;
    });
  }

  late final _$escolaridadeAtom =
      Atom(name: '_RegisterStore.escolaridade', context: context);

  @override
  String get escolaridade {
    _$escolaridadeAtom.reportRead();
    return super.escolaridade;
  }

  @override
  set escolaridade(String value) {
    _$escolaridadeAtom.reportWrite(value, super.escolaridade, () {
      super.escolaridade = value;
    });
  }

  late final _$funcaoAtom =
      Atom(name: '_RegisterStore.funcao', context: context);

  @override
  String get funcao {
    _$funcaoAtom.reportRead();
    return super.funcao;
  }

  @override
  set funcao(String value) {
    _$funcaoAtom.reportWrite(value, super.funcao, () {
      super.funcao = value;
    });
  }

  late final _$competenciasAtom =
      Atom(name: '_RegisterStore.competencias', context: context);

  @override
  ObservableList<Competencia> get competencias {
    _$competenciasAtom.reportRead();
    return super.competencias;
  }

  @override
  set competencias(ObservableList<Competencia> value) {
    _$competenciasAtom.reportWrite(value, super.competencias, () {
      super.competencias = value;
    });
  }

  late final _$_RegisterStoreActionController =
      ActionController(name: '_RegisterStore', context: context);

  @override
  void setNome(String value) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCpf(String value) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setCpf');
    try {
      return super.setCpf(value);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCompetencia(
      {required String competencia, required int nivelProficiencia}) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.addCompetencia');
    try {
      return super.addCompetencia(
          competencia: competencia, nivelProficiencia: nivelProficiencia);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDataNascimento(String value) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setDataNascimento');
    try {
      return super.setDataNascimento(value);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTelefone(String value) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setTelefone');
    try {
      return super.setTelefone(value);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEscolaridade(String value) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setEscolaridade');
    try {
      return super.setEscolaridade(value);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFuncao(String value) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setFuncao');
    try {
      return super.setFuncao(value);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCompetencias(List<Competencia> value) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setCompetencias');
    try {
      return super.setCompetencias(value);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome},
cpf: ${cpf},
dataNascimento: ${dataNascimento},
email: ${email},
telefone: ${telefone},
escolaridade: ${escolaridade},
funcao: ${funcao},
competencias: ${competencias}
    ''';
  }
}
