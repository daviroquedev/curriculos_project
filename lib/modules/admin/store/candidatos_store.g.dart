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

  late final _$_CandidatosStoreActionController =
      ActionController(name: '_CandidatosStore', context: context);

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
candidatosFuture: ${candidatosFuture},
candidatos: ${candidatos}
    ''';
  }
}
