import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:travel_nepal/common/constant/app_dimens.dart';
import 'package:travel_nepal/core/injection/injection_service.dart';
import 'package:travel_nepal/core/services/local_storage.dart';
import 'package:travel_nepal/theme/app_theme.dart';

void main() async {
  await LocalStorageService.init();

  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      position: ToastPosition.bottom,
      child: ScreenUtilInit(
        designSize: const Size(AppDimens.appWidth, AppDimens.appHeight),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => MaterialApp(
          theme: AppThemes.light,
          debugShowCheckedModeBanner: false,
          home: Text("hello"),
        ),
      ),
    );
  }
}
