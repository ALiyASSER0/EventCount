
import 'package:event_count_downar/onboarding/onboarding_page.dart';
import 'package:event_count_downar/routing/routes.dart';
import 'package:event_count_downar/views/home_view.dart';
import 'package:event_count_downar/views/installments_view.dart';
import 'package:event_count_downar/views/notes_view.dart';
import 'package:event_count_downar/views/splash_page.dart';
import 'package:flutter/material.dart';

Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Routes.splash:
      return MaterialPageRoute(
          builder: (_) => const SplashPage(), settings: routeSettings);
    case Routes.onboarding:
      return MaterialPageRoute(
          builder: (_) => const OnboardingPage(), settings: routeSettings);
    case Routes.homeView:
      return MaterialPageRoute(
          builder: (_) =>  HomeView(), settings: routeSettings);
    case Routes.noteView:
      return MaterialPageRoute(
          builder: (_) => const NotesView(), settings: routeSettings);
    case Routes.installments:
      return MaterialPageRoute(
          builder: (_) => const InstallmentsView(), settings: routeSettings);
    default:
      return null;
  }
}
