import 'package:flutter/material.dart';
import 'package:travel_nepal/theme/app_theme.dart';

Widget kChip({required Widget child, Color? bgColor}) {
  return Container(
      padding: const EdgeInsets.only(top: 2, bottom: 2, left: 4, right: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: bgColor ?? primaryColor,
      ),
      child: child);
}
