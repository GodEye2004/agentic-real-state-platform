import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/config/app_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'config/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // rtl configs
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'مشاور املاک هوشمند',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,

      // تنظیمات RTL و Localization
      locale: const Locale('fa', 'IR'),
      supportedLocales: const [Locale('en', 'US'), Locale('fa', 'IR')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
