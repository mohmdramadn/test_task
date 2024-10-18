import 'package:flutter/material.dart';
import 'package:test_task/core/router/routes_names.dart';
import 'package:test_task/features/login/presentation/pages/login_screen.dart';

import '../../features/onboarding/presentation/pages/onboarding_screen.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.loginRoute:
      return MaterialPageRoute(
          builder: (context) => const LoginScreen(), settings: settings);

    case Routes.onboardingRoute:
      return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(), settings: settings);

    default:
      return MaterialPageRoute(builder: (context) => const OnboardingScreen());
  }
}