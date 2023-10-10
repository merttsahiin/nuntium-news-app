import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuntium_news_app/constants/color_constants.dart';
import 'package:nuntium_news_app/constants/image_constants.dart';
import 'package:nuntium_news_app/ui/components/nuntium_page_routes.dart';
import 'package:nuntium_news_app/ui/components/system_ui_manager.dart';
import 'package:nuntium_news_app/ui/screens/onboarding_screen.dart';

class SplasScreen extends StatefulWidget {
  const SplasScreen({super.key});

  @override
  State<SplasScreen> createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplasScreen> {
  @override
  void initState() {
    super.initState();
    goToApp();
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiManager.setStatusBarDarkIconBrightness,
    );

    super.dispose();
  }

  Future<void> goToApp() async {
    await Future.delayed(
      const Duration(seconds: 1),
      () {
        if (mounted) {
          Navigator.pushAndRemoveUntil<void>(
            context,
            NuntiumPageRoutes.defaultRoute(const OnboardingScreen()),
            (route) => false,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.purplePrimary,
      body: Center(
        child: Image.asset(ImageConstants.logoPath),
      ),
    );
  }
}
