import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:travel_nepal/common/utils/app_text_style.dart';

@RoutePage()
class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "DASHBOARD",
        style: appTextStyle(context)!.copyWith(color: Colors.black),
      )),
    );
  }
}
