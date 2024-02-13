import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_nepal/common/widgets/k_loading_indicator.dart';

Widget kTickButton(
    {void Function()? onTap,
    required bool isLoding,
    required BuildContext context}) {
  return InkWell(
    borderRadius: BorderRadius.circular(80).r,
    onTap: onTap,
    child: CircleAvatar(
      backgroundColor: Colors.transparent,
      child: isLoding == true
          ? SizedBox(
              height: 20.h,
              width: 20.w,
              child: kLoadingIndicator(
                context: context,
                background: Colors.white,
                strockWidth: 3.w,
              ),
            )
          : Icon(
              Icons.check,
              color: Colors.white,
              size: 30.sh,
            ),
    ),
  );
}
