import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:travel_nepal/common/constant/app_dimens.dart';
import 'package:travel_nepal/common/constant/app_image.dart';
import 'package:travel_nepal/common/constant/ui_helpers.dart';
import 'package:travel_nepal/common/utils/app_text_style.dart';
import 'package:travel_nepal/common/widgets/k_button.dart';
import 'package:travel_nepal/core/app_routers/app_routers.dart';
import 'package:travel_nepal/core/app_routers/app_routers.gr.dart';
import 'package:travel_nepal/core/injection/injection_service.dart';

@RoutePage()
class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationService = locator<AppRouters>();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImage.mountain),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Explore the \nbeauty of Nepal\nwith us.",
                  style: appTextStyle(context)!.copyWith(
                      fontWeight: AppDimens.lfontweight,
                      letterSpacing: 0.1,
                      fontSize: AppDimens.headlineFontSizeMedium),
                ),
                mHeightSpan,
                Row(
                  children: [
                    KButton(
                      size: ButtonSize.small,
                      child: const Text("Get started  ->"),
                      onPressed: () {
                        navigationService.pushAndPopUntil(
                          const DashboardView(),
                          predicate: (route) => false,
                        );
                      },
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
