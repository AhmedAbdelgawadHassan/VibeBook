import 'package:books/core/utils/app_assets.dart';
import 'package:books/features/splash/presentation/views/onboardind_view2.dart';
import 'package:books/features/splash/presentation/views/widgets/customAppbar.dart';
import 'package:books/features/splash/presentation/views/widgets/onboardind_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Onboarding1View1 extends StatelessWidget {
  const Onboarding1View1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B0D1D),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Customappbar(),
              const Gap(24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        AppAssets.onboardingfirstImage,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const Gap(28),
                    const Text(
                      'Your Personal\nLibrary',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NotoSerif',
                        height: 1.15,
                      ),
                    ),
                    const Gap(12),
                    const Text(
                      'Organize your digital collection with a tactile, linen-bound feel. Curate your own literary sanctuary.',
                      style: TextStyle(
                        color: Color(0xff94A3B8),
                        fontFamily: 'manrope',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),

              OnboardindButton(
                text: 'Next',
                onpressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => OnboardindView2()),
                  );
                },
              ),
              const Gap(8),
            ],
          ),
        ),
      ),
    );
  }
}
