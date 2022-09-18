import 'package:challenge/core/routes.dart';
import 'package:challenge/di/injector.dart';
import 'package:challenge/presentation/home_page/view/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:challenge/presentation/common_widgets/custom_snackbar.dart';

import 'package:easy_localization/easy_localization.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await _initialConfig();
  setUp();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

Future<void> _initialConfig() async {
  await EasyLocalization.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CT challenge',
      routes: MyRoutes().routes,
      initialRoute: HomePage.routeName,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
