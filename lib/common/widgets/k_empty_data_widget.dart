import 'package:flutter/material.dart';

Widget kEmptyDataWidget(String text) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // SvgPicture.asset(
      //   AppImage.emptyimageSvg,
      // ),
      Text(
        text,
        // style: appTextStyle!.copyWith(
        //     color: disabledColor,
        //     fontStyle: FontStyle.italic,
        //     fontSize: AppDimens.headlineFontSizeXSmall),
      ),
    ],
  );
}
