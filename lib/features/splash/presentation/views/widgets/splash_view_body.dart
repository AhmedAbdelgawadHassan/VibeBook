// ignore_for_file: use_build_context_synchronously

import 'package:books/constants.dart';
import 'package:books/core/services/shared_preference_services.dart';
import 'package:books/core/utils/app_assets.dart';
import 'package:books/features/home/presentation/views/home_view.dart';
import 'package:books/features/splash/presentation/views/onboarding1_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState()  {
   
    super.initState();
    Future.delayed(Duration(seconds: 3), ()async {
       bool isSeen = await Prefs.getBool(kOnboardingSeen) ?? false;;
      isSeen
          ? Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeView()),
            )
          : Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Onboarding1View1()),
            );
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppAssets.splashLogo),
        SvgPicture.asset(AppAssets.appNameLogo),
        Gap(12),
        Text(
          'Curated Stories. Timeless Vibes.',
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'manrope',
            color: Color(0xffA7A5A0),
            fontWeight: FontWeight.w500,
          ),
        ),
        Gap(25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90),
          child: LinearProgressIndicator(
            minHeight: 5,
            borderRadius: BorderRadius.circular(20),
            backgroundColor: Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
          ),
        ), // Loading Progress Bar
        Gap(25),
        Text(
          'Read. Reflect. Evolve.',
          style: TextStyle(
            fontSize: 10,
            fontFamily: 'manrope',
            color: Color(0xffA7A5A0),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
