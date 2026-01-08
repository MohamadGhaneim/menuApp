import 'dart:async';
import 'package:flutter/material.dart';
import 'package:menuapp/config/app_routes.dart';
import 'package:menuapp/util/validation/auth_login.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () async => Navigator.of(context).pushNamedAndRemoveUntil(
        await AuthLogin.isLoggedIn() ? AppRoutes.root : AppRoutes.onboarding,
        (route) => false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Expanded(child: Image.asset('assets/images/c.jpg')));
  }
}
