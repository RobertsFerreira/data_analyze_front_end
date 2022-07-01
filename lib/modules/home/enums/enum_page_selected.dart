import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum EnumPageSelect {
  home(
    title: 'Home',
    icon: FontAwesomeIcons.house,
    widget: Center(
      child: Text('Home'),
    ),
  ),

  uploadFile(
    title: 'Upload File',
    icon: FontAwesomeIcons.fileArrowUp,
    widget: Center(
      child: Text('Upload File'),
    ),
  ),

  openFile(
    title: 'Open File',
    icon: FontAwesomeIcons.filePen,
    widget: Center(
      child: Text('Open File'),
    ),
  ),

  statics(
    title: 'Statics',
    icon: FontAwesomeIcons.chartLine,
    widget: Center(
      child: Text('Statics'),
    ),
  );

  final String title;
  final Widget widget;
  final IconData icon;
  const EnumPageSelect({
    required this.title,
    required this.icon,
    required this.widget,
  });
}
