import 'package:books/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DownloadBookButton extends StatelessWidget {
  const DownloadBookButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  static const double _outerRadius = 18;
  static const double _innerRadius = 16;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_outerRadius),
       
        ),
        child: Material(
          color: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_innerRadius),
          ),
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(_innerRadius),
            splashColor: AppColors.secondaryColor.withValues(alpha: 0.25),
            highlightColor: AppColors.secondaryColor.withValues(alpha: 0.08),
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_innerRadius),
                border: Border.all(
                  color: Colors.white.withOpacity(0.8),
                  width: 1.5,
                ),
              ),
              child: SizedBox.expand(
                child: Center(
                  child: Icon(
                    FontAwesomeIcons.download.data,
                    size: 20,
                    color: AppColors.secondaryColor,
                    shadows: [
                      Shadow(
                        color: AppColors.secondaryColor.withValues(alpha: 0.55),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
