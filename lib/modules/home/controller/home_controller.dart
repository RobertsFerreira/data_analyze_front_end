import 'dart:io';

import 'package:data_analyze/utils/async_function.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../error/home_error.dart';
import '../models/respostas/respostas_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final TextEditingController textEditingController = TextEditingController();

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
  List<String> questions = [];

  @computed
  int get numberOfQuestions => questions.length;

  @action
  void loadDados() {
    if (file != null) {
      final fileRead = file!.readAsLinesSync();
      questions = fileRead[0].split(';').toList();
      textEditingController.text = numberOfQuestions.toString();
    }
  }

  @action
  Future<void> getFile() => asyncAction(() async {
        setLoading(true);
        try {
          FilePickerResult? fileResult = await FilePicker.platform.pickFiles();
          if (fileResult != null) {
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
