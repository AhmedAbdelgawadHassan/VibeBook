import 'package:books/core/utils/app_colors.dart';
import 'package:books/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const VibeBook());
}


class VibeBook extends StatelessWidget {
  const VibeBook({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: AppColors.primaryColor),
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}