import 'package:books/features/seacrh/presentation/views/widgets/searchTextfiled.dart';
import 'package:books/features/seacrh/presentation/views/widgets/search_result_listview.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Search',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontFamily: 'NotoSerif',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body:CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child:  Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Find your next favorite book',
              style: TextStyle(
                color: Color(0xff9CA3AF),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
           Gap(20),
           Searchtextfiled(),
            Gap(20),
            Text('Search results',style: TextStyle(fontSize: 22,fontFamily: 'NotoSerif',fontWeight: FontWeight.bold,color: Colors.white),),
            Gap(20),
            Expanded(child: SearchResultListview())
          ],
        ),
      ) ,
          )
        ],
      )
     
    );
  }
}