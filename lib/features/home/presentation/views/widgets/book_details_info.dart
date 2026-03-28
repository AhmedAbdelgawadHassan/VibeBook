import 'package:books/features/home/presentation/views/widgets/book_details_info_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookDatailsInfo extends StatelessWidget {
  const BookDatailsInfo ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Color(0xff1C1917),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
       Text('Book Details',style: TextStyle(fontSize: 20,fontFamily: 'NotoSerif',fontWeight: FontWeight.bold,color: Colors.white),),
      const Gap(10),
       BookDetailsInfoItem(title: 'Published',value: 'October 2022',),
       BookDetailsInfoItem(title: 'Publisher', value: 'Harper'),
       BookDetailsInfoItem(title: 'Language', value: 'English'),
       BookDetailsInfoItem(title: 'Genre', value: 'Magical Realism'),
        ],
      ),
    );
  }
}