// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manipulation_file_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ManipulationFileController on _ManipulationFileControllerBase, Store {
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

  late final _$file64Atom =
      Atom(name: '_ManipulationFileControllerBase.file64', context: context);

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

  late final _$_ManipulationFileControllerBaseActionController =
      ActionController(
          name: '_ManipulationFileControllerBase', context: context);

  @override
  void setFileB64(Uint8List bytes) {
    final _$actionInfo = _$_ManipulationFileControllerBaseActionController
        .startAction(name: '_ManipulationFileControllerBase.setFileB64');
    try {
      return super.setFileB64(bytes);
    } finally {
      _$_ManipulationFileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void verifyStatusApi() {
    final _$actionInfo = _$_ManipulationFileControllerBaseActionController
        .startAction(name: '_ManipulationFileControllerBase.verifyStatusApi');
    try {
      return super.verifyStatusApi();
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
file: ${file},
error: ${error},
file64: ${file64}
    ''';
  }
}
