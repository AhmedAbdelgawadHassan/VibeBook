import 'package:books/core/utils/app_colors.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FreereadindButton extends StatelessWidget {
  const FreereadindButton({super.key, required this.onpressed});
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [
            AppColors.secondaryColor,
            Color(0xffF3C980),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x55E5B56E),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed:onpressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: const Color(0xff0B0D1D),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: const BorderSide(
              color: Color(0x66FFFFFF),
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.bookOpen.data,
              size: 18,
              color: const Color(0xff0B0D1D),
            ),
            const Gap(10),
            const Text(
              'Free Reading',
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'NotoSerif',
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}