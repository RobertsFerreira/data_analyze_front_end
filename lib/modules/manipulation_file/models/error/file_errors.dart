import '../../../../models/error/exception/generic_exception.dart';

class FileNotFound extends GenericException {
  FileNotFound({
    required super.message,
    super.keys,
    super.datas,
  });
}

class FileSelectError extends GenericException {
  FileSelectError({
    required super.message,
    super.keys,
    super.datas,
  });
}

class InvalidFileError extends GenericException {
  InvalidFileError({
    required super.message,
    super.keys,
    super.datas,
  });
}
