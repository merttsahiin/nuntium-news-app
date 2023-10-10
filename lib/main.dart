import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuntium_news_app/constants/app_constants.dart';
import 'package:nuntium_news_app/core/providers/bookmarks_provider.dart';
import 'package:nuntium_news_app/ui/components/nuntium_theme.dart';
import 'package:nuntium_news_app/ui/components/system_ui_manager.dart';
import 'package:nuntium_news_app/ui/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiManager.setStatusBarLightIconBrightness,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BookmarksProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: AppTheme.theme,
      home: const SplasScreen(),
    );
  }
}
