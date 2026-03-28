import 'package:books/features/home/presentation/views/widgets/bestSeller_listview_item.dart';
import 'package:flutter/material.dart';

class BestsellerListview extends StatelessWidget {
  const BestsellerListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
              itemCount: 20,
              itemBuilder:  (context, index) {
               return  Padding(
                padding: EdgeInsetsGeometry.only(bottom: 20),
                child: BestsellerListviewItem());
             },);
  }
}