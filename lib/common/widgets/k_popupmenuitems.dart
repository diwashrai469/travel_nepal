import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget kPopupMenuItems(
    {Function(String)? onSelected,
    required List<PopupMenuEntry<String>> Function(BuildContext) itemBuilder,
    required Widget child}) {
  return PopupMenuButton<String>(
    color: Colors.white,
    offset: const Offset(0, 40),
    padding: const EdgeInsets.all(20).dg,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        const Radius.circular(8.0).r,
      ),
    ),
    onSelected: onSelected,
    itemBuilder: itemBuilder,
    child: child,
  );
}
