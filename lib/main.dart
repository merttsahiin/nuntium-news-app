import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'ui/screens/splash_screen.dart';
import 'ui/components/nuntium_theme.dart';
import 'ui/components/system_ui_manager.dart';
import '/constants/app_constants.dart';
import '/core/providers/bookmarks_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiManager.setStatusBarLightIconBrightness,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => BookmarksProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: NuntiumTheme.theme,
      home: const SplasScreen(),
    );
  }
}
