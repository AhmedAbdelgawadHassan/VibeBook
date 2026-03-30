import 'package:books/features/home/data/models/book_model/book_model.dart';
import 'package:books/features/home/presentation/views/widgets/book_details_info_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookDatailsInfo extends StatelessWidget {
  const BookDatailsInfo({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardBg = isDark ? const Color(0xff1C1917) : Colors.white;
    final headerColor = isDark ? Colors.white : Colors.black;

    return Container(
      padding: EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            'Book Details',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'NotoSerif',
              fontWeight: FontWeight.bold,
              color: headerColor,
            ),
          ),
          const Gap(10),
          BookDetailsInfoItem(
            title: 'Published',
            value: bookModel.volumeInfo.publishedDate ?? "Unknown",
          ),
          BookDetailsInfoItem(
            title: 'Publisher',
            value: bookModel.volumeInfo.publisher ?? 'Unknown',
          ),
          BookDetailsInfoItem(
            title: 'Language',
            value: bookModel.volumeInfo.language ?? 'Unknown',
          ),
          BookDetailsInfoItem(
            title: 'Genre',
            value: (bookModel.volumeInfo.categories ?? const []).join(', '),
          ),
        ],
      ),
    );
  }
}
