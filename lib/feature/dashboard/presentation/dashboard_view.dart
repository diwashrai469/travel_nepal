import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:travel_nepal/common/constant/app_dimens.dart';
import 'package:travel_nepal/common/constant/ui_helpers.dart';
import 'package:travel_nepal/common/widgets/k_textformfield.dart';

@RoutePage()
class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: AppDimens.mainPagePadding,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  KTextFormField(
                    hint: "Search destination",
                  ),
                  CircleAvatar(),
                  mHeightSpan,
                  Chip(label: Text("this is a demo chip"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
