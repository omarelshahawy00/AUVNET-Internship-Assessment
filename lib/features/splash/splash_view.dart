import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nawel/core/network/services/firebase_auth_service.dart';
import 'package:nawel/core/network/services/prefs.dart';
import 'package:nawel/core/routes/routes.dart';
import 'package:nawel/core/utils/assets_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    // Start the fade animation after a short delay
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    // Navigate to home after 2.5 seconds
    Timer(const Duration(seconds: 3), () {
      final onboardingSeen = SharedPrefsService.getBool(kOnboardingSeen);
      if (onboardingSeen == true) {
        bool isLoggedIn = FirebaseAuthService().isUserLoggedIn();
        if (isLoggedIn) {
          context.go(Routes.home); // <- Replace with your actual home route
        } else {
          context.go(Routes.login); // <- Replace with your actual login route
        }
      } else {
        context.go(Routes.onboarding); // <- Replace with your actual home route
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(seconds: 2),
          opacity: _opacity,
          curve: Curves.easeIn,
          child: Image.asset(
            AssetsManager.nawel, // Replace with correct path
          ),
        ),
      ),
    );
  }
}
