import 'package:flutter/material.dart';
import 'package:test_task/core/router/routes_names.dart';
import 'package:test_task/features/login/presentation/pages/login_screen.dart';

import '../../features/forget_password/presentation/pages/forget_password_screen.dart';
import '../../features/forget_password/presentation/pages/otp_screen.dart';
import '../../features/forget_password/presentation/pages/reset_password_screen.dart';
import '../../features/onboarding/presentation/pages/onboarding_screen.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.loginRoute:
      return MaterialPageRoute(
          builder: (context) => const LoginScreen(), settings: settings);

    case Routes.onboardingRoute:
      return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(), settings: settings);

    case Routes.forgetPasswordRoute:
      return MaterialPageRoute(
          builder: (context) => const ForgetPasswordScreen(),
          settings: settings);

    case Routes.otpRoute:
      var phone = settings.arguments as String;
      return MaterialPageRoute(
          builder: (context) => OtpScreen(phoneSentTo: phone),
          settings: settings);

    case Routes.resetPasswordRoute:
      return MaterialPageRoute(
          builder: (context) => const ResetPasswordScreen(),
          settings: settings);

    default:
      return MaterialPageRoute(builder: (context) => const OnboardingScreen());
  }
}
