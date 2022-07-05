import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../controller/home_controller.dart';

class HomePage extends StatelessWidget {
  final controller = HomeController();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Busca de Padrões"),
        centerTitle: true,
      ),
      body: Row(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: 150,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Image.asset('assets/images/logo.jpg', fit: BoxFit.cover),
                ),
                const Divider(),
                Observer(
                  builder: (_) {
                    final indexPageSelected = controller.pageSelect.index;
                    final destinations = controller.destinations;
                    return Expanded(
                      child: NavigationRail(
                        selectedIndex: indexPageSelected,
                        labelType: NavigationRailLabelType.all,
                        onDestinationSelected: controller.setSelectedPage,
                        destinations: destinations,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          const VerticalDivider(),
          Expanded(
            child: Observer(
              builder: (_) {
                final widgetPageSelected = controller.pageSelect.widget;
                return widgetPageSelected;
              },
            ),
          )
        ],
      ),
      // body: Center(
      //   child: Column(
      //     children: [
      //       // Expanded(
      //       //   child: NavigationRail(
      //       //     selectedIndex: 0,
      //       //     labelType: NavigationRailLabelType.all,
      //       //     destinations: [
      //       //       NavigationRailDestination(
      //       //         icon: const Icon(Icons.abc),
      //       //         label: Container(),
      //       //       ),
      //       //       NavigationRailDestination(
      //       //         icon: const Icon(Icons.account_balance),
      //       //         label: Container(),
      //       //       ),
      //       //     ],
      //       //   ),
      //       // ),
      //       // const Spacer(),
      //       SizedBox(
      //         height: 450,
      //         width: 450,
      //         child: Image.asset('assets/images/logo.jpg'),
      //       ),
      //       const SizedBox(),
      //       SizedBox(
      //         height: 80,
      //         width: 200,
      //         child: TextFormField(
      //           enabled: false,
      //           controller: controller.textEditingController,
      //           decoration: const InputDecoration(
      //             border: OutlineInputBorder(
      //               borderRadius: BorderRadius.all(
      //                 Radius.circular(5),
      //               ),
      //             ),
      //             label: Text('Número de Questões'),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(),
      //       Observer(
      //         builder: (_) {
      //           final isLoading = controller.isLoading;
      //           return Row(
      //             mainAxisSize: MainAxisSize.min,
      //             children: [
      //               FloatingActionButton.extended(
      //                 onPressed: () async {
      //                   await controller.getFile();
      //                   final error = controller.error;
      //                   if (error is FileError) {
      //                     showDialog(
      //                       context: context,
      //                       builder: (ctx) {
      //                         return CustomDialog(
      //                           messageTitle: 'Carregar Arquivo',
      //                           messageBtnNo: 'Fechar',
      //                           erroMessage: error.message,
      //                           functionBtnNo: () => Navigator.pop(ctx),
      //                         );
      //                       },
      //                     );
      //                   } else if (error is ChooseFileError) {
      //                     showDialog(
      //                       context: context,
      //                       builder: (ctx) {
      //                         return CustomDialog(
      //                           messageTitle: 'Selecionar Arquivo',
      //                           messageBtnNo: 'Não',
      //                           messageBtnYes: 'Sim',
      //                           erroMessage: error.message,
      //                           functionBtnNo: () => Navigator.pop(ctx),
      //                           functionBtnYes: () async =>
      //                               await controller.getFile(),
      //                         );
      //                       },
      //                     );
      //                   } else if (error != null) {
      //                     showDialog(
      //                       context: context,
      //                       builder: (ctx) {
      //                         return CustomDialog(
      //                           messageTitle: 'Erro Desconhecido',
      //                           messageBtnNo: 'Fechar',
      //                           erroMessage: error.message,
      //                           functionBtnNo: () => Navigator.pop(ctx),
      //                         );
      //                       },
      //                     );
      //                   }
      //                 },
      //                 label: isLoading
      //                     ? const CircularProgressIndicator()
      //                     : const Text(
      //                         'Selecionar Base de Dados',
      //                         textAlign: TextAlign.center,
      //                       ),
      //               ),
      //               const SizedBox(width: 10),
      //               FloatingActionButton.extended(
      //                 onPressed: () => Navigator.of(context).pushNamed('help'),
      //                 label: Row(
      //                   mainAxisSize: MainAxisSize.min,
      //                   children: const [
      //                     Text('Ajuda'),
      //                     Icon(Icons.question_mark)
      //                   ],
      //                 ),
      //               ),
      //               const SizedBox(width: 10),
      //               FloatingActionButton.extended(
      //                 onPressed: () async => controller.uploadFile(),
      //                 label: Row(
      //                   mainAxisSize: MainAxisSize.min,
      //                   children: const [
      //                     Text('Enviar arquivo'),
      //                     Icon(Icons.web)
      //                   ],
      //                 ),
      //               ),
      //             ],
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      floatingActionButton: const Tooltip(
        message: 'Ajuda',
        child: FloatingActionButton.extended(
          onPressed: null,
          label: FaIcon(FontAwesomeIcons.circleQuestion),
        ),
      ),
    );
  }
}
