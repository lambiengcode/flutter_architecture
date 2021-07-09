import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/di/app_initializer.dart';
import 'package:flutter_architecture/src/di/dependency_injection.dart';
import 'package:flutter_architecture/src/lang/translation_service.dart';
import 'package:flutter_architecture/src/providers/user_provider.dart';
import 'package:flutter_architecture/src/routes/app_pages.dart';
import 'package:flutter_architecture/src/themes/theme_service.dart';
import 'package:flutter_architecture/src/themes/themes.dart';
import 'package:flutter_architecture/src/utils/logger/logger.dart';
import 'package:flutter_architecture/src/utils/sizer/sizer.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

Injector injector = Injector();

void main() async {
  // Init dependency injection
  injector = DependencyInjection().initialiseSocket(injector);
  await AppInitializer().initialise(injector);
  // Connect local storage before start application
  await GetStorage.init();
  runApp(
    // Using provider for state management all application

    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(),
        ),
      ],
      // Using sizer for responsive

      child: Sizer(
        builder: (context, orientation, deviceType) {
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
        },
      ),
    ),
  );
}
