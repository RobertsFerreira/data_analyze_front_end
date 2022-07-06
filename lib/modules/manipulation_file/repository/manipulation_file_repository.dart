import 'package:fpdart/fpdart.dart';

import '../../../interface/http_client_interface.dart';
import '../../../models/error/exception/generic_exception.dart';

class ManipulationFileRepository {
  final HttpClientInterface client;

  ManipulationFileRepository(this.client);

  Future<Either<GenericException, bool>> verifyStatusApi() async {
    try {
      final result = await client.get('/sobre');
      if (result['version'] != '') {
        return const Right(true);
      }
      return const Right(false);
    } catch (e) {
      return Left(
        UnknownError(
          message: e.toString(),
        ),
      );
    }
  }
}
