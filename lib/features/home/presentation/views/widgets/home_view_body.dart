import 'package:books/core/utils/app_colors.dart';
import 'package:books/features/home/presentation/views/widgets/newestBooks_listView.dart';
import 'package:books/features/home/presentation/views/widgets/featured_books_listview.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});
  

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 17) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                getGreeting(),
                style: const TextStyle(
                  fontSize: 36,
                  fontFamily: 'NotoSerif',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Gap(5),
              const Text(
                'Find your next great adventure today.',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'manrope',
                  fontWeight: FontWeight.w400,
                  color: Color(0xff9CA3AF),
                ),
              ),
              const Gap(18),
            Gap(20),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.22,
              width: double.infinity,
              child:FeaturedBooksListview(
              )
              
            ),
            Gap(20),
             Row(
              children: [
                Text('Newest Books',style: TextStyle(fontSize: 24,fontFamily: 'NotoSerif',fontWeight: FontWeight.w800,color: Colors.white),),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text('View All',style: TextStyle(fontSize:14,fontFamily: 'NotoSerif',fontWeight: FontWeight.w800,color: AppColors.secondaryColor),)),
              ],
            ),
            Gap(20),
                ],
              ),
            )
            ,
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: NewestbooksListview(),
              )
          )
        ],
    ));
  }
}

