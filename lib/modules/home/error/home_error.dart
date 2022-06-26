import '../../../models/error/exception/generic_exception.dart';

class FileError extends GenericException {
  FileError({
    required super.message,
    super.keys,
    super.datas,
  });
}

class ChooseFileError extends GenericException {
  ChooseFileError({
    required super.message,
    super.keys,
    super.datas,
  });
}
