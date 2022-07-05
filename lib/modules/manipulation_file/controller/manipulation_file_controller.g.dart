// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manipulation_file_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ManipulationFileController on _ManipulationFileControllerBase, Store {
  late final _$pathAtom =
      Atom(name: '_ManipulationFileControllerBase.path', context: context);

  @override
  File? get path {
    _$pathAtom.reportRead();
    return super.path;
  }

  @override
  set path(File? value) {
    _$pathAtom.reportWrite(value, super.path, () {
      super.path = value;
    });
  }

  late final _$_ManipulationFileControllerBaseActionController =
      ActionController(
          name: '_ManipulationFileControllerBase', context: context);

  @override
  void openFile() {
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
path: ${path}
    ''';
  }
}
