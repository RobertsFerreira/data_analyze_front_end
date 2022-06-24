// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<List<RespostasModel>>? _$filterRespostasComputed;

  @override
  List<RespostasModel> get filterRespostas => (_$filterRespostasComputed ??=
          Computed<List<RespostasModel>>(() => super.filterRespostas,
              name: '_HomeControllerBase.filterRespostas'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: '_HomeControllerBase.isLoading', context: context);

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

  late final _$respostasAtom =
      Atom(name: '_HomeControllerBase.respostas', context: context);

  @override
  List<RespostasModel> get respostas {
    _$respostasAtom.reportRead();
    return super.respostas;
  }

  @override
  set respostas(List<RespostasModel> value) {
    _$respostasAtom.reportWrite(value, super.respostas, () {
      super.respostas = value;
    });
  }

  late final _$textSearchAtom =
      Atom(name: '_HomeControllerBase.textSearch', context: context);

  @override
  String get textSearch {
    _$textSearchAtom.reportRead();
    return super.textSearch;
  }

  @override
  set textSearch(String value) {
    _$textSearchAtom.reportWrite(value, super.textSearch, () {
      super.textSearch = value;
    });
  }

  late final _$getFileAsyncAction =
      AsyncAction('_HomeControllerBase.getFile', context: context);

  @override
  Future<void> getFile() {
    return _$getFileAsyncAction.run(() => super.getFile());
  }

  late final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase', context: context);

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTextSearch(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setTextSearch');
    try {
      return super.setTextSearch(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
respostas: ${respostas},
textSearch: ${textSearch},
filterRespostas: ${filterRespostas}
    ''';
  }
}
