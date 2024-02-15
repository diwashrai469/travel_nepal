// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:travel_nepal/feature/dashboard/presentation/dashboard_view.dart'
    as _i1;
import 'package:travel_nepal/feature/onboarding/presentation/onboarding_view.dart'
    as _i2;

abstract class $AppRouters extends _i3.RootStackRouter {
  $AppRouters({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    DashboardView.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DashboardView(),
      );
    },
    OnboardingView.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.OnboardingView(),
      );
    },
  };
}

/// generated route for
/// [_i1.DashboardView]
class DashboardView extends _i3.PageRouteInfo<void> {
  const DashboardView({List<_i3.PageRouteInfo>? children})
      : super(
          DashboardView.name,
          initialChildren: children,
        );

  static const String name = 'DashboardView';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.OnboardingView]
class OnboardingView extends _i3.PageRouteInfo<void> {
  const OnboardingView({List<_i3.PageRouteInfo>? children})
      : super(
          OnboardingView.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingView';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
