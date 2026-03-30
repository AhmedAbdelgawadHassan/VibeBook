import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookDetailsInfoItem extends StatelessWidget {
  const BookDetailsInfoItem({
    super.key,
    required this.title,
    required this.value,
  });
  final String title, value;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final titleColor = isDark ? const Color(0xffA8A29E) : Colors.black54;
    final valueColor = isDark ? Colors.white : Colors.black;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'manrope',
                fontWeight: FontWeight.w500,
                color: titleColor,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.55,
              child: Text(
                value,
                maxLines: 1,
                textAlign: TextAlign.end,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'manrope',
                  fontWeight: FontWeight.w600,
                  color: valueColor,
                ),
              ),
            ),
          ],
        ),
        const Gap(5),
        Divider(),
      ],
    );
  }
}
