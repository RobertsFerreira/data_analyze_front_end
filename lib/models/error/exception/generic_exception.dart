import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:data_analyze/utils/format_date.dart';

class GenericException implements Exception {
  final String message;
  final List<String>? keys;
  final List<dynamic>? datas;

  GenericException({
    required this.message,
    this.keys,
    this.datas,
  }) {
    generatedFileLog();
  }

  void generatedFileLog() {
    try {
      final file = File('error.log');
      if (!file.existsSync()) {
        //   final dir = Directory('error');
        //   if (!dir.existsSync()) dir.createSync();
        file.createSync();
      }
      final time = DateTime.now();
      file.writeAsStringSync(
        'Horário: ${formatDate(time, true)}\n\n',
        mode: FileMode.append,
      );

      file.writeAsStringSync(
        'Error: $message\n\n',
        mode: FileMode.append,
      );

      const enconder = JsonEncoder.withIndent("    ");

      if (datas != null && datas!.isNotEmpty) {
        final dadosLog = _createJsonLog();

        final dadosLogStr = enconder.convert(dadosLog);

        file.writeAsStringSync(dadosLogStr, mode: FileMode.append);

        file.writeAsStringSync(
          '\n\n--------------------------------------------------------------------\n\n',
          mode: FileMode.append,
        );
      }
    } catch (error, stackTrace) {
      log(error.toString(), error: error, stackTrace: stackTrace);
      generatedFileLog();
    }
  }

  List<dynamic> _createJsonLog() {
    List<Map<String, dynamic>> map = <Map<String, dynamic>>[];

    if (keys != null && datas != null) {
      final bool onlyFirst = keys!.length == 1;

      for (var key in keys!) {
        if (onlyFirst) {
          map = datas!
              .map(
                (dado) => {
                  key: dado,
                },
              )
              .toList();
        } else {
          final index = keys!.indexOf(key);
          map.add({
            key: datas![index],
          });
        }
      }
    }
    return map;
  }
}

class UnknownError extends GenericException {
  UnknownError({
    required super.message,
    super.keys,
    super.datas,
  });
}
