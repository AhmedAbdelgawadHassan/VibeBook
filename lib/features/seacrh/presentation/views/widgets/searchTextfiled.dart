import 'package:books/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Searchtextfiled extends StatelessWidget {
  const Searchtextfiled({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [Color(0xff2A3140), Color(0xff1B2230)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
          BoxShadow(
            color: Color(0x269EA0F5),
            blurRadius: 18,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
        cursorColor: AppColors.secondaryColor,
        decoration: InputDecoration(
          hintText: 'Search books, authors, genres...',
          hintStyle: const TextStyle(
            color: Color(0xffA6AFBF),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 12, right: 6),
            child: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              size: 17,
              color: AppColors.secondaryColor,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(minWidth: 46),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: const Color(0xff2B3447),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xff3C4A63), width: 1),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.tune_rounded,
                  color: AppColors.secondaryColor,
                  size: 20,
                ),
              ),
            ),
          ),
          filled: true,
          fillColor: Colors.transparent,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 17,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Color(0xff3B465A),
              width: 1.2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: AppColors.secondaryColor,
              width: 1.8,
            ),
          ),
        ),
      ),
    );
  }
}