import 'package:flutter/material.dart';
import '../../services/fake_data_service.dart';
import '../routing/route_names.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  // Navigation methods
  static Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  static Future<dynamic> navigateToReplacement(
    String routeName, {
    Object? arguments,
  }) {
    return navigatorKey.currentState!.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  static Future<dynamic> navigateToAndRemoveUntil(
    String routeName, {
    Object? arguments,
  }) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  static void navigateBack() {
    return navigatorKey.currentState!.pop();
  }

  // Specific navigation methods with fake data
  static void navigateToHomeWithFakeData() {
    navigateToAndRemoveUntil(RouteNames.home);
  }

  static void navigateToLoginWithFakeData() {
    navigateTo(RouteNames.login);
  }

  static void navigateToSignupWithFakeData() {
    navigateTo(RouteNames.signup);
  }

  static void navigateToPhoneRegistrationWithFakeData() {
    navigateTo(RouteNames.phoneRegistration);
  }

  static void navigateToPhoneVerificationWithFakeData() {
    navigateTo(RouteNames.phoneVerification);
  }

  // Get fake data for forms
  static String getFakeFullName() => FakeDataService.getFakeData('fullName');
  static String getFakeEmail() => FakeDataService.getFakeData('email');
  static String getFakePhone() => FakeDataService.getFakeData('phone');
  static String getFakePassword() => FakeDataService.getFakeData('password');
}
