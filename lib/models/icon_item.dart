import 'package:flutter/widgets.dart';

class IconItem {
  final String footer;
  final IconData iconData;
  bool selected;

  IconItem({
    @required this.footer,
    @required this.iconData,
    this.selected = false,
  });
}
