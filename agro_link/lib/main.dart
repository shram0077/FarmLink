import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'core/providers/language_provider.dart';
import 'core/routing/app_router.dart';
import 'core/routing/route_names.dart';
import 'core/navigation/navigation_service.dart';
import 'shared/utils/constants.dart';
import 'l10n/app_localizations.dart';

// Custom English Material Localizations for Kurdish locale
class _EnglishMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const _EnglishMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<MaterialLocalizations> load(Locale locale) {
    return GlobalMaterialLocalizations.delegate.load(const Locale('en'));
  }

  @override
  bool shouldReload(_EnglishMaterialLocalizationDelegate old) => false;
}

// Custom English Cupertino Localizations for Kurdish locale
class _EnglishCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const _EnglishCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) {
    return GlobalCupertinoLocalizations.delegate.load(const Locale('en'));
  }

  @override
  bool shouldReload(_EnglishCupertinoLocalizationDelegate old) => false;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      child: Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) {
          return MaterialApp(
            title: 'FarmLink',
            debugShowCheckedModeBanner: false,
            locale: languageProvider.currentLocale,
            supportedLocales: const [
              Locale('en', ''), // English
              Locale('ar', ''), // Arabic
              Locale('ku', ''), // Kurdish
            ],
            localizationsDelegates: [
              AppLocalizations.delegate,
              // For Kurdish, use English Material localizations to avoid crashes
              languageProvider.currentLanguage == 'ku'
                  ? const _EnglishMaterialLocalizationDelegate()
                  : GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              // For Kurdish, use English Cupertino localizations to avoid crashes
              languageProvider.currentLanguage == 'ku'
                  ? const _EnglishCupertinoLocalizationDelegate()
                  : GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              // Check if the current device locale is supported
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale?.languageCode) {
                  return supportedLocale;
                }
              }

              // If not supported, default to English
              return const Locale('en', '');
            },
            theme: ThemeData(
              primaryColor: AppColors.primaryGreen,
              scaffoldBackgroundColor: AppColors.background,
              fontFamily: GoogleFonts.inter().fontFamily,
              appBarTheme: const AppBarTheme(
                backgroundColor: AppColors.cardBackground,
                elevation: 0,
                iconTheme: IconThemeData(color: AppColors.textPrimary),
                titleTextStyle: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppConstants.borderRadius,
                    ),
                  ),
                ),
              ),
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    AppConstants.borderRadius,
                  ),
                ),
                filled: true,
                fillColor: AppColors.cardBackground,
              ),
              cardTheme: CardThemeData(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppConstants.borderRadius,
                  ),
                ),
              ),
            ),
            builder: (context, child) {
              return Directionality(
                textDirection: languageProvider.isRtl
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: child!,
              );
            },
            navigatorKey: NavigationService.navigatorKey,
            initialRoute: RouteNames.splash,
            onGenerateRoute: AppRouter.generateRoute,
          );
        },
      ),
    );
  }
}
