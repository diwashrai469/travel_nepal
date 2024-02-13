import 'package:flutter/material.dart';
import 'package:travel_nepal/theme/app_theme.dart';

kBottonsheet(
  BuildContext context,
  Widget widget,
  bool isScrollControlled,
) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: isScrollControlled,
    builder: (context) => widget,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12))),
    backgroundColor: lightThemescaffoldColor,
  );
}
