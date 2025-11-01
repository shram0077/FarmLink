import 'package:flutter/material.dart';
import '../routing/route_names.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/welcome/welcome_screen.dart';
import '../../features/auth/login/login_screen.dart';
import '../../features/auth/signup/signup_screen.dart';
import '../../features/auth/phone_registration/phone_registration_screen.dart';
import '../../features/auth/phone_verification/phone_verification_screen.dart';
import '../../features/navigation/main_navigation_screen.dart';
import '../../features/view_specilatys/view_specialites.dart';
import '../../features/select_language/select_language_screen.dart';
import '../../features/chat/chat_screen.dart';
import '../../features/market/market_screen.dart';
import '../../features/ai/ai_chat_screen.dart';
import '../../features/education/education_screen.dart';
import '../../models/expert.dart';
import '../../l10n/app_localizations.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteNames.welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteNames.signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case RouteNames.phoneRegistration:
        return MaterialPageRoute(
          builder: (_) => const PhoneRegistrationScreen(),
        );
      case RouteNames.phoneVerification:
        return MaterialPageRoute(
          builder: (_) => const PhoneVerificationScreen(),
        );
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const MainNavigationScreen());
      case RouteNames.specialists:
        return MaterialPageRoute(builder: (_) => const ViewSpecialites());
      case RouteNames.selectLanguage:
        return MaterialPageRoute(builder: (_) => const SelectLanguageScreen());
      case RouteNames.chat:
        if (settings.arguments != null && settings.arguments is Expert) {
          final expert = settings.arguments as Expert;
          return MaterialPageRoute(builder: (_) => ChatScreen(expert: expert));
        }
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text(
                AppLocalizations.of(context)?.noExpertProvided ??
                    'No expert provided for chat',
              ),
            ),
          ),
        );
      case RouteNames.calendar:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)?.calendar ?? 'Calendar'),
            ),
            body: Center(
              child: Text(
                AppLocalizations.of(context)?.calendarFeature ??
                    'Calendar feature coming soon!',
              ),
            ),
          ),
        );
      case RouteNames.education:
        return MaterialPageRoute(builder: (context) => const EducationScreen());
      case RouteNames.feedback:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)?.feedback ?? 'Feedback'),
            ),
            body: Center(
              child: Text(
                AppLocalizations.of(context)?.feedbackFeature ??
                    'Feedback feature coming soon!',
              ),
            ),
          ),
        );
      case RouteNames.market:
        return MaterialPageRoute(builder: (_) => const MarketScreen());
      case RouteNames.ai:
        return MaterialPageRoute(builder: (_) => const AIChatScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text(
                '${AppLocalizations.of(context)?.noRouteDefined ?? 'No route defined for'} ${settings.name}',
              ),
            ),
          ),
        );
    }
  }
}
