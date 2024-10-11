
import 'package:event_count_downar/home_page.dart';
import 'package:event_count_downar/onboarding/onboarding_page.dart';
import 'package:event_count_downar/routing/routes.dart';
import 'package:event_count_downar/splash_page.dart';
import 'package:flutter/material.dart';

Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Routes.splash:
      return MaterialPageRoute(
          builder: (_) => SplashPage(), settings: routeSettings);
    case Routes.onboarding:
      return MaterialPageRoute(
          builder: (_) => const OnboardingPage(), settings: routeSettings);
    case Routes.home:
      return MaterialPageRoute(
          builder: (_) => const HomePage(), settings: routeSettings);
    default:
      return null;
  }
}
