import 'package:books/features/home/presentation/views/widgets/newestBooks_listView.dart';
import 'package:flutter/material.dart';

class SearchResultListview extends StatelessWidget {
  const SearchResultListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
              itemCount: 20,
              itemBuilder:  (context, index) {
               return  Padding(
                padding: EdgeInsetsGeometry.only(bottom: 20),
                child: NewestbooksListview());
             },);
  }
}