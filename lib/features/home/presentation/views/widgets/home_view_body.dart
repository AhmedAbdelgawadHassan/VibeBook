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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final titleColor = isDark ? Colors.white : Colors.black;
    final subtitleColor = isDark ? const Color(0xff9CA3AF) : Colors.black54;
    final sectionTitleColor = isDark ? Colors.white : Colors.black;

    return SafeArea(
      child: CustomScrollView(
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
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'NotoSerif',
                      fontWeight: FontWeight.bold,
                      color: titleColor,
                    ),
                  ),
                  const Gap(5),
                  Text(
                    'Find your next great adventure today.',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'manrope',
                      fontWeight: FontWeight.w400,
                      color: subtitleColor,
                    ),
                  ),
                  const Gap(18),
                  Gap(20),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: double.infinity,
                    child: FeaturedBooksListview(),
                  ),
                  Gap(20),
                  Row(
                    children: [
                      Text(
                        'Newest Books',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'NotoSerif',
                          fontWeight: FontWeight.w800,
                          color: sectionTitleColor,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'View All',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'NotoSerif',
                            fontWeight: FontWeight.w800,
                            color: AppColors.secondaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(20),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: NewestbooksListview(),
            ),
          ),
        ],
      ),
    );
  }
}
