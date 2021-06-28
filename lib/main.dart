import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/app.dart';
import 'package:flutter_architecture/src/providers/user_provider.dart';
import 'package:flutter_architecture/src/utils/sizer/sizer.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() async {
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
          return App();
        },
      ),
    ),
  );
}
