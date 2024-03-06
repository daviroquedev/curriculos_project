// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidatos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CandidatosStore on _CandidatosStore, Store {
  Computed<List<Map<String, dynamic>>>? _$candidatosComputed;

  @override
  List<Map<String, dynamic>> get candidatos => (_$candidatosComputed ??=
          Computed<List<Map<String, dynamic>>>(() => super.candidatos,
              name: '_CandidatosStore.candidatos'))
      .value;

  late final _$nomeAtom = Atom(name: '_CandidatosStore.nome', context: context);

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

  late final _$cpfAtom = Atom(name: '_CandidatosStore.cpf', context: context);

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
      Atom(name: '_CandidatosStore.dataNascimento', context: context);

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

  late final _$emailAtom =
      Atom(name: '_CandidatosStore.email', context: context);

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
      Atom(name: '_CandidatosStore.telefone', context: context);

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
      Atom(name: '_CandidatosStore.escolaridade', context: context);

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

  late final _$candidatosFutureAtom =
      Atom(name: '_CandidatosStore.candidatosFuture', context: context);

  @override
  ObservableFuture<List<Map<String, dynamic>>> get candidatosFuture {
    _$candidatosFutureAtom.reportRead();
    return super.candidatosFuture;
  }

  @override
  set candidatosFuture(ObservableFuture<List<Map<String, dynamic>>> value) {
    _$candidatosFutureAtom.reportWrite(value, super.candidatosFuture, () {
      super.candidatosFuture = value;
    });
  }

  late final _$atualizarStatusSolicitacaoAsyncAction = AsyncAction(
      '_CandidatosStore.atualizarStatusSolicitacao',
      context: context);

  @override
  Future<void> atualizarStatusSolicitacao(
      int id, String status, BuildContext context) {
    return _$atualizarStatusSolicitacaoAsyncAction
        .run(() => super.atualizarStatusSolicitacao(id, status, context));
  }

  late final _$getUsuarioLogadoAsyncAction =
      AsyncAction('_CandidatosStore.getUsuarioLogado', context: context);

  @override
  Future<void> getUsuarioLogado() {
    return _$getUsuarioLogadoAsyncAction.run(() => super.getUsuarioLogado());
  }

  late final _$atualizarUsuarioLogadoAsyncAction =
      AsyncAction('_CandidatosStore.atualizarUsuarioLogado', context: context);

  @override
  Future<void> atualizarUsuarioLogado(Map<String, dynamic> userData) {
    return _$atualizarUsuarioLogadoAsyncAction
        .run(() => super.atualizarUsuarioLogado(userData));
  }

  late final _$_CandidatosStoreActionController =
      ActionController(name: '_CandidatosStore', context: context);

  @override
  void setNome(String value) {
    final _$actionInfo = _$_CandidatosStoreActionController.startAction(
        name: '_CandidatosStore.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_CandidatosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCpf(String value) {
    final _$actionInfo = _$_CandidatosStoreActionController.startAction(
        name: '_CandidatosStore.setCpf');
    try {
      return super.setCpf(value);
    } finally {
      _$_CandidatosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDataNascimento(String value) {
    final _$actionInfo = _$_CandidatosStoreActionController.startAction(
        name: '_CandidatosStore.setDataNascimento');
    try {
      return super.setDataNascimento(value);
    } finally {
      _$_CandidatosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_CandidatosStoreActionController.startAction(
        name: '_CandidatosStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_CandidatosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTelefone(String value) {
    final _$actionInfo = _$_CandidatosStoreActionController.startAction(
        name: '_CandidatosStore.setTelefone');
    try {
      return super.setTelefone(value);
    } finally {
      _$_CandidatosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEscolaridade(String value) {
    final _$actionInfo = _$_CandidatosStoreActionController.startAction(
        name: '_CandidatosStore.setEscolaridade');
    try {
      return super.setEscolaridade(value);
    } finally {
      _$_CandidatosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchCandidatos() {
    final _$actionInfo = _$_CandidatosStoreActionController.startAction(
        name: '_CandidatosStore.fetchCandidatos');
    try {
      return super.fetchCandidatos();
    } finally {
      _$_CandidatosStoreActionController.endAction(_$actionInfo);
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
candidatosFuture: ${candidatosFuture},
candidatos: ${candidatos}
    ''';
  }
}
