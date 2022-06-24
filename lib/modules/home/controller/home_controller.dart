import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:mobx/mobx.dart';

import '../models/respostas/respostas_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  bool isLoading = false;

  @action
  void setLoading(bool value) => isLoading = value;

  @action
  Future<void> getFile() async {
    setLoading(true);
    try {
      FilePickerResult? fileResult = await FilePicker.platform.pickFiles();
      if (fileResult != null) {
        final String? path = fileResult.files.single.path;
        if (path != null) {
          await Future.delayed(const Duration(seconds: 3));
          File file = File(path);
          log(file.readAsStringSync());
        } else {
          throw Exception("Erro ao ler caminho do arquivo");
        }
      } else {
        throw Exception("Erro ao selecionar o arquivo");
      }
    } catch (e) {
      rethrow;
    } finally {
      setLoading(false);
    }
  }

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
