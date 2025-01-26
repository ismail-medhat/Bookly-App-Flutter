import 'package:bookly_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SplashViewBody(),
    );
  }
}
