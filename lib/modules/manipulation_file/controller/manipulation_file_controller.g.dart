// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manipulation_file_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ManipulationFileController on _ManipulationFileControllerBase, Store {
  Computed<List<String>>? _$questionsComputed;

  @override
  List<String> get questions =>
      (_$questionsComputed ??= Computed<List<String>>(() => super.questions,
              name: '_ManipulationFileControllerBase.questions'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: '_ManipulationFileControllerBase.isLoading', context: context);

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

  late final _$fileAtom =
      Atom(name: '_ManipulationFileControllerBase.file', context: context);

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

  late final _$errorAtom =
      Atom(name: '_ManipulationFileControllerBase.error', context: context);

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

  late final _$messageSuccessAtom = Atom(
      name: '_ManipulationFileControllerBase.messageSuccess', context: context);

  @override
  String get messageSuccess {
    _$messageSuccessAtom.reportRead();
    return super.messageSuccess;
  }

  @override
  set messageSuccess(String value) {
    _$messageSuccessAtom.reportWrite(value, super.messageSuccess, () {
      super.messageSuccess = value;
    });
  }

  late final _$resultAprioriAtom = Atom(
      name: '_ManipulationFileControllerBase.resultApriori', context: context);

  @override
  List<ResultApriori> get resultApriori {
    _$resultAprioriAtom.reportRead();
    return super.resultApriori;
  }

  @override
  set resultApriori(List<ResultApriori> value) {
    _$resultAprioriAtom.reportWrite(value, super.resultApriori, () {
      super.resultApriori = value;
    });
  }

  late final _$_ManipulationFileControllerBaseActionController =
      ActionController(
          name: '_ManipulationFileControllerBase', context: context);

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_ManipulationFileControllerBaseActionController
        .startAction(name: '_ManipulationFileControllerBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_ManipulationFileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> verifyStatusApi() {
    final _$actionInfo = _$_ManipulationFileControllerBaseActionController
        .startAction(name: '_ManipulationFileControllerBase.verifyStatusApi');
    try {
      return super.verifyStatusApi();
    } finally {
      _$_ManipulationFileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> uploadFile() {
    final _$actionInfo = _$_ManipulationFileControllerBaseActionController
        .startAction(name: '_ManipulationFileControllerBase.uploadFile');
    try {
      return super.uploadFile();
    } finally {
      _$_ManipulationFileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> openFile() {
    final _$actionInfo = _$_ManipulationFileControllerBaseActionController
        .startAction(name: '_ManipulationFileControllerBase.openFile');
    try {
      return super.openFile();
    } finally {
      _$_ManipulationFileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
file: ${file},
error: ${error},
messageSuccess: ${messageSuccess},
resultApriori: ${resultApriori},
questions: ${questions}
    ''';
  }
}
