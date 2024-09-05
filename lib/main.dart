// import 'package:demo_app/home_page.dart';
// import 'package:demo_app/languages.dart';
// import 'package:demo_app/translations/codegen_loader.g.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await EasyLocalization.ensureInitialized();

//   runApp(
//     EasyLocalization(
//       path: 'assets/translations',
//       supportedLocales: const [
//         Locale('en'),
//         Locale('ar'),
//         Locale('es'),
//         Locale('hi'),
//       ],
//       fallbackLocale: const Locale('en'),
//       assetLoader: const CodegenLoader(),
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   static void setLocale(BuildContext context, Locale newLocale) {
//     context.setLocale(newLocale);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       translations: Languages(),
//       locale: const Locale('en', 'US'),
//       fallbackLocale: const Locale('en', 'US'),
//       home: const HomePageScreen(
//         title: '',
//       ),
//     );
//   }
// }

import 'package:demo_app/home_page.dart';
import 'package:demo_app/languages.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      translations: Languages(),
      locale: Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePageScreen(
        title: '',
      ),
    );
  }
}
