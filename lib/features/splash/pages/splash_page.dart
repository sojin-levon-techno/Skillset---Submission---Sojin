// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:skilltest/core/extension/mediaquery.dart';
import 'package:skilltest/core/extension/navigation.dart';
import 'package:skilltest/features/auth/views/pages/login_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
        const Duration(milliseconds: 2000),
        () => context.pushAndRemoveUntil(page: LoginPage()),
      );
    });

    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/app_logo.png",
          height: context.height * 0.3,
          width: context.height * 0.3,
        ).animate().fade(duration: const Duration(milliseconds: 1500)),
      ),
    );
  }
}
