import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookDetailsInfoItem extends StatelessWidget {
  const BookDetailsInfoItem({super.key, required this.title, required this.value});
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: TextStyle(fontSize: 14,fontFamily: 'manrope',fontWeight: FontWeight.w500,color: Color(0xffA8A29E)),),
          Text(value,style: TextStyle(fontSize: 14,fontFamily: 'manrope',fontWeight: FontWeight.w600,color: Colors.white),),
          ],
        ),
        const Gap(5),
      Divider()
      ],
    );
  }
}