import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'onboarding_screen.dart';
import '/constants/color_constants.dart';
import '/constants/image_constants.dart';
import '../components/system_ui_manager.dart';
import '../components/nuntium_page_routes.dart';

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
  dispose() {
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
