import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = HomeController();
    return Scaffold(
      body: Observer(
        builder: (_) {
          final respostas = controller.filterRespostas;
          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  onChanged: controller.setTextSearch,
                  decoration: const InputDecoration(
                    labelText: 'Pesquisar',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: respostas.length,
                  itemBuilder: (_, index) {
                    final resposta = respostas[index];
                    return ExpansionTile(
                      childrenPadding: const EdgeInsets.only(left: 16),
                      title: Text(
                        'Resposta ${resposta.codigo}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    resposta.naturalUba
                                        ? 'Bairro: ${resposta.bairro}'
                                        : 'Cidade: ${resposta.cidade}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    resposta.naturalUba
                                        ? 'Porcentagem de orgulho de ser Ubaense: ${resposta.porcOrgulhoUbaense == 0 ? 'Não informado' : resposta.porcOrgulhoUbaense}'
                                        : 'Tempo de Vivencia em Ubá: ${resposta.tempoVivenciaUba == 0 ? 'Não informado' : resposta.tempoVivenciaUba}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                            Expanded(
                              child: CheckboxListTile(
                                value: resposta.naturalUba,
                                onChanged: (value) {},
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
