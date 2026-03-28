import 'package:books/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({
    super.key, required this.bookImage,
  });


  static const double _radius = 20;
  final String bookImage;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Material(
        color: Colors.transparent,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_radius),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.45),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
              BoxShadow(
                color: AppColors.secondaryColor.withValues(alpha: 0.22),
                blurRadius: 28,
                offset: const Offset(0, 6),
                spreadRadius: -4,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(_radius),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  bookImage,
                  fit: BoxFit.cover,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.35, 1],
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.55),
                      ],
                    ),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.12),
                    ),
                    borderRadius: BorderRadius.circular(_radius),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
