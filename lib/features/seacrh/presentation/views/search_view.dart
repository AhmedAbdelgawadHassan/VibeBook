import 'package:books/core/services/service_locator.dart';
import 'package:books/core/presentation/manager/cubits/theme_cubit/theme_cubit.dart';
import 'package:books/features/home/data/repos/home_repo_impl.dart';
import 'package:books/features/seacrh/presentation/manager/cubits/search_books_cubit/search_books_cubit.dart';
import 'package:books/features/seacrh/presentation/manager/cubits/search_books_cubit/search_books_states.dart';
import 'package:books/features/seacrh/presentation/views/widgets/searchTextfiled.dart';
import 'package:books/features/seacrh/presentation/views/widgets/search_result_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBooksCubit(
        SearchBooksInitialState(),
        homeRepo: getIt.get<HomeRepoImpl>(),
      ),
      child: Builder(
        builder: (context) => Scaffold(
          body: BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              final isDark = themeMode == ThemeMode.dark;
              final textColor = isDark ? Colors.white : Colors.black;
              final subtitleColor = isDark
                  ? const Color(0xff9CA3AF)
                  : Colors.black54;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Text(
                      'Find your next favorite book',
                      style: TextStyle(
                        color: subtitleColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Searchtextfiled(
                      controller: _searchController,
                      onSearch: (query) {
                        context.read<SearchBooksCubit>().searchBooks(
                          query: query,
                        );
                      },
                    ),
                  ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Search results',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'NotoSerif',
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                  ),
                  const Gap(20),
                  const Expanded(child: SearchResultListview()),
                ],
              );
            },
          ),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, themeMode) {
                final isDark = themeMode == ThemeMode.dark;
                final titleColor = isDark ? Colors.white : Colors.black;
                return Text(
                  'Search',
                  style: TextStyle(
                    color: titleColor,
                    fontSize: 28,
                    fontFamily: 'NotoSerif',
                    fontWeight: FontWeight.w700,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
