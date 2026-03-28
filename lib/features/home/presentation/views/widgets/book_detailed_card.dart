import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookDetailedCard extends StatelessWidget {
  const BookDetailedCard({super.key, required this.value, required this.title, required this.titleColor});
  final String value, title; 
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.4,
      child: AspectRatio(
        aspectRatio: 3/1.6,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
           color: Color(0xff1C1917),
           borderRadius: BorderRadius.circular(12),
           border: Border.all(color: Colors.white ),
          ),
         child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(value,style: TextStyle(fontSize: 18,fontFamily: 'manrope',fontWeight: FontWeight.bold,color:titleColor),),
              Gap(5),
              Text(title,style: TextStyle(fontSize: 12,fontFamily: 'manrope',fontWeight: FontWeight.bold,color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}