import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:mobx/mobx.dart';

import '../error/home_error.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @action
  Future<File> getFile() async {
    try {
      FilePickerResult? fileResult = await FilePicker.platform.pickFiles();
      if (fileResult != null) {
        String? path = fileResult.files.single.path;
        path = null;
        if (path != null) {
          File file = File(path);
          return file;
        } else {
          throw FileError(
            message: "Erro ao ler caminho do arquivo",
          );
        }
      } else {
        throw ChooseFileError(
          message: "Erro ao selecionar o arquivo",
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
