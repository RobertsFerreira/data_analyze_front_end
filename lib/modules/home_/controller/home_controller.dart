import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:data_analyze/utils/async_function.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../error/home_error.dart';
import '../models/respostas/respostas_model.dart';
import '../repository/home_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final TextEditingController textEditingController = TextEditingController();
  final repository = HomeRepository();

  @observable
  bool isLoading = false;

  @action
  void setLoading(bool value) => isLoading = value;

  @observable
  dynamic error;

  @observable
  File? file;

  @action
  void setFile(File? value) => file = value;

  @observable
  Uint8List file64 = Uint8List(1);

  @action
  void setFileB64(Uint8List file) => file64 = file;

  @observable
  List<String> questions = [];

  @computed
  int get numberOfQuestions => questions.length;

  @action
  Future<void> uploadFile() => asyncAction(() async {
        if (file != null) {
          final FormData formData = FormData.fromMap(
            {
              'file': MultipartFile.fromBytes(
                file64,
                filename: file!.absolute.path,
              ),
            },
          );
          final result = await repository.upload(formData);
          log(result.toString());
        }
      });

  @action
  void loadDados() {
    if (file != null) {
      final fileRead = file!.readAsLinesSync();
      questions = fileRead[0].split(';').toList();
      textEditingController.text = numberOfQuestions.toString();
    }
  }

  @action
  void verifyStatsApi() => asyncAction(() async {
        setLoading(true);
        try {
          final result = await repository.verifyStatsApi();
          log(result.toString());
        } catch (e) {
          log(e.toString());
        } finally {
          setLoading(false);
        }
      });

  @action
  Future<void> getFile() => asyncAction(() async {
        setLoading(true);
        try {
          FilePickerResult? fileResult =
              await FilePicker.platform.pickFiles(withData: true);
          if (fileResult != null) {
            final fileB64 = fileResult.files.first.bytes!;
            setFileB64(fileB64);
            String? path = fileResult.files.single.path;
            if (path != null) {
              error = null;
              File file = File(path);
              setFile(file);
              loadDados();
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
        } on FileError catch (e) {
          error = e;
        } on ChooseFileError catch (e) {
          error = e;
        } finally {
          setLoading(false);
        }
      });

  @observable
  List<RespostasModel> respostas = [
    RespostasModel(
      codigo: 1,
      naturalUba: true,
      bairro: 'Ponte Preta',
      porcOrgulhoUbaense: 7,
    ),
    RespostasModel(
      codigo: 2,
      naturalUba: false,
      cidade: 'Guiricema',
      porcOrgulhoUbaense: 28,
    ),
    RespostasModel(
      codigo: 3,
      naturalUba: true,
      bairro: 'Ponte Preta',
      porcOrgulhoUbaense: 7,
    ),
    RespostasModel(
      codigo: 4,
      naturalUba: true,
      bairro: 'Ponte Preta',
      porcOrgulhoUbaense: 8,
    ),
    RespostasModel(
      codigo: 5,
      naturalUba: true,
      bairro: 'Ponte Preta',
      porcOrgulhoUbaense: 8,
    ),
    RespostasModel(
      codigo: 6,
      naturalUba: true,
      cidade: 'Caxangá',
      porcOrgulhoUbaense: 5,
    ),
    RespostasModel(
      codigo: 7,
      naturalUba: false,
      cidade: 'Ubaporanga',
      tempoVivenciaUba: 33,
    ),
    RespostasModel(
      codigo: 8,
      naturalUba: true,
      cidade: 'Meu Sonho',
      porcOrgulhoUbaense: 10,
    ),
    RespostasModel(
      codigo: 9,
      naturalUba: true,
      bairro: 'Ponte Preta',
      porcOrgulhoUbaense: 6,
    ),
    RespostasModel(
      codigo: 10,
      naturalUba: false,
      cidade: 'Angra dos Reis',
      porcOrgulhoUbaense: 40,
    ),
  ].asObservable();

  @computed
  List<RespostasModel> get filterRespostas {
    List<RespostasModel> resp = respostas;
    resp = respostas
        .where((resp) => resp.codigo.toString().contains(textSearch))
        .toList()
        .asObservable();
    if (resp.isEmpty) {
      resp = respostas.asObservable();
    }
    return resp.asObservable();
  }

  @observable
  String textSearch = '';

  @action
  void setTextSearch(String value) => textSearch = value;
}
