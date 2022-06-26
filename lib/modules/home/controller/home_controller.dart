import 'package:data_analyze/utils/async_function.dart';
import 'package:mobx/mobx.dart';

import '../models/respostas/respostas_model.dart';
import '../store/home_store.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final homeStore = HomeStore();

  @observable
  bool isLoading = false;

  @action
  void setLoading(bool value) => isLoading = value;

  @observable
  dynamic error;

  @action
  Future<void> getFile() => asyncAction(() async {
        setLoading(true);
        try {
          await homeStore.getFile();
        } catch (e) {
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
