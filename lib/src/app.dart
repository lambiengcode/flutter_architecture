import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_architecture/src/lang/translation_service.dart';
import 'package:flutter_architecture/src/routes/app_pages.dart';
import 'package:flutter_architecture/src/themes/theme_service.dart';
import 'package:flutter_architecture/src/themes/themes.dart';
import 'package:flutter_architecture/src/utils/logger/logger.dart';
import 'package:get/route_manager.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    // Lock orientation device is vertical, if you don't want it, let comment below 3 lines.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // If you want look performance application, let remove comment below line.
      // If screens have less 16ms for render, it's good performance.
      // showPerformanceOverlay: true,
      title: 'Application Name',
      enableLog: true,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.native,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.light().data,
      darkTheme: AppTheme.dark().data,
      themeMode: ThemeService().getThemeMode(),
      logWriterCallback: Logger.write,
    );
  }
}
