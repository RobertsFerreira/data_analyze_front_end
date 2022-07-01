// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<int>? _$numberOfQuestionsComputed;

  @override
  int get numberOfQuestions => (_$numberOfQuestionsComputed ??= Computed<int>(
          () => super.numberOfQuestions,
          name: '_HomeControllerBase.numberOfQuestions'))
      .value;
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

  late final _$errorAtom =
      Atom(name: '_HomeControllerBase.error', context: context);

  @override
  dynamic get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(dynamic value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$fileAtom =
      Atom(name: '_HomeControllerBase.file', context: context);

  @override
  File? get file {
    _$fileAtom.reportRead();
    return super.file;
  }

  @override
  set file(File? value) {
    _$fileAtom.reportWrite(value, super.file, () {
      super.file = value;
    });
  }

  late final _$file64Atom =
      Atom(name: '_HomeControllerBase.file64', context: context);

  @override
  Uint8List get file64 {
    _$file64Atom.reportRead();
    return super.file64;
  }

  @override
  set file64(Uint8List value) {
    _$file64Atom.reportWrite(value, super.file64, () {
      super.file64 = value;
    });
  }

  late final _$questionsAtom =
      Atom(name: '_HomeControllerBase.questions', context: context);

  @override
  List<String> get questions {
    _$questionsAtom.reportRead();
    return super.questions;
  }

  @override
  set questions(List<String> value) {
    _$questionsAtom.reportWrite(value, super.questions, () {
      super.questions = value;
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
  void setFile(File? value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setFile');
    try {
      return super.setFile(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFileB64(Uint8List file) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setFileB64');
    try {
      return super.setFileB64(file);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> uploadFile() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.uploadFile');
    try {
      return super.uploadFile();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loadDados() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.loadDados');
    try {
      return super.loadDados();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void verifyStatsApi() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.verifyStatsApi');
    try {
      return super.verifyStatsApi();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> getFile() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getFile');
    try {
      return super.getFile();
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
error: ${error},
file: ${file},
file64: ${file64},
questions: ${questions},
respostas: ${respostas},
textSearch: ${textSearch},
numberOfQuestions: ${numberOfQuestions},
filterRespostas: ${filterRespostas}
    ''';
  }
}
