// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_vagas_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserVagasStore on _UserPageStore, Store {
  Computed<List<VagaResponseModel>>? _$vagasComputed;

  @override
  List<VagaResponseModel> get vagas =>
      (_$vagasComputed ??= Computed<List<VagaResponseModel>>(() => super.vagas,
              name: '_UserPageStore.vagas'))
          .value;

  late final _$nomeAtom = Atom(name: '_UserPageStore.nome', context: context);

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

  late final _$emailAtom = Atom(name: '_UserPageStore.email', context: context);

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

  late final _$statusSolicitacaoAtom =
      Atom(name: '_UserPageStore.statusSolicitacao', context: context);

  @override
  String get statusSolicitacao {
    _$statusSolicitacaoAtom.reportRead();
    return super.statusSolicitacao;
  }

  @override
  set statusSolicitacao(String value) {
    _$statusSolicitacaoAtom.reportWrite(value, super.statusSolicitacao, () {
      super.statusSolicitacao = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_UserPageStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$vagasFutureAtom =
      Atom(name: '_UserPageStore.vagasFuture', context: context);

  @override
  ObservableFuture<List<VagaResponseModel>> get vagasFuture {
    _$vagasFutureAtom.reportRead();
    return super.vagasFuture;
  }

  @override
  set vagasFuture(ObservableFuture<List<VagaResponseModel>> value) {
    _$vagasFutureAtom.reportWrite(value, super.vagasFuture, () {
      super.vagasFuture = value;
    });
  }

  late final _$loadUserDataAsyncAction =
      AsyncAction('_UserPageStore.loadUserData', context: context);

  @override
  Future<void> loadUserData() {
    return _$loadUserDataAsyncAction.run(() => super.loadUserData());
  }

  late final _$loadVagasAsyncAction =
      AsyncAction('_UserPageStore.loadVagas', context: context);

  @override
  Future<void> loadVagas() {
    return _$loadVagasAsyncAction.run(() => super.loadVagas());
  }

  late final _$candidatarVagaAsyncAction =
      AsyncAction('_UserPageStore.candidatarVaga', context: context);

  @override
  Future<void> candidatarVaga(int vagaId) {
    return _$candidatarVagaAsyncAction.run(() => super.candidatarVaga(vagaId));
  }

  late final _$_UserPageStoreActionController =
      ActionController(name: '_UserPageStore', context: context);

  @override
  void updateVagaState(int vagaId) {
    final _$actionInfo = _$_UserPageStoreActionController.startAction(
        name: '_UserPageStore.updateVagaState');
    try {
      return super.updateVagaState(vagaId);
    } finally {
      _$_UserPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome},
email: ${email},
statusSolicitacao: ${statusSolicitacao},
isLoading: ${isLoading},
vagasFuture: ${vagasFuture},
vagas: ${vagas}
    ''';
  }
}
