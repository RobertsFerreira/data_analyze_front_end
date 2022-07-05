import '../../../../models/error/exception/generic_exception.dart';

class FileNotFound extends GenericException {
  FileNotFound({
    required super.message,
    super.keys,
    super.datas,
  });
}
