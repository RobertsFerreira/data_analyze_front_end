// ignore_for_file: library_private_types_in_public_api

import 'package:data_analyze/modules/home/enums/enum_page_selected.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  EnumPageSelect pageSelect = EnumPageSelect.values.first;

  @action
  void setSelectedPage(int index) => pageSelect = EnumPageSelect.values[index];

  @computed
  List<NavigationRailDestination> get destinations => EnumPageSelect.values
      .map(
        (page) => NavigationRailDestination(
          icon: FaIcon(page.icon),
          label: Text(page.title),
        ),
      )
      .toList();
}
