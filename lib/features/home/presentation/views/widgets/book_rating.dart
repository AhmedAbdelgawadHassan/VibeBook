import 'package:books/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.secondaryColor.withValues(
                                  alpha: 0.14,
                                ),
                                borderRadius: BorderRadius.circular(999),
                                border: Border.all(
                                  color: AppColors.secondaryColor.withValues(
                                    alpha: 0.22,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.star_rounded,
                                    size: 17,
                                    color: Colors.amber.shade400,
                                  ),
                                  const Gap(4),
                                  Text(
                                    '4.5',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'manrope',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white.withValues(
                                        alpha: 0.9,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
  }
}