import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookDetailedCard extends StatelessWidget {
  const BookDetailedCard({
    super.key,
    required this.value,
    required this.title,
    required this.titleColor,
  });
  final String value, title;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardBg = isDark ? const Color(0xff1C1917) : Colors.white;
    final cardBorder = isDark ? Colors.white : Colors.black.withOpacity(0.1);
    final secondaryTextColor = isDark ? Colors.white : Colors.black54;

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: AspectRatio(
        aspectRatio: 3 / 1.6,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: cardBorder),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'manrope',
                  fontWeight: FontWeight.bold,
                  color: titleColor,
                ),
              ),
              Gap(5),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'manrope',
                  fontWeight: FontWeight.bold,
                  color: secondaryTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
