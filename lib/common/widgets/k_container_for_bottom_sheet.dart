import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/app_theme.dart';

Widget kContainerForBottomSheet() {
  return Center(
    child: Container(
      height: 6.h,
      width: 70.w,
      decoration: BoxDecoration(
        color: disabledColor,
        borderRadius: const BorderRadius.all(Radius.circular(15)).r,
      ),
    ),
  );
}
