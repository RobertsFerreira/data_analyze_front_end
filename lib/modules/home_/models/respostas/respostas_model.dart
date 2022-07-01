class RespostasModel {
  final int codigo;
  final String? cidade;
  final bool naturalUba;
  final String? bairro;
  final int? tempoVivenciaUba;
  final int? porcOrgulhoUbaense;

  RespostasModel({
    required this.codigo,
    this.cidade = 'Não informado',
    required this.naturalUba,
    this.bairro = 'Não informado',
    this.tempoVivenciaUba = 0,
    this.porcOrgulhoUbaense = 0,
  });
}
