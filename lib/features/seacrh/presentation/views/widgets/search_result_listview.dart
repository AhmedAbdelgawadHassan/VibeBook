import 'package:books/core/widgets/book_item_shimmer.dart';
import 'package:books/core/widgets/custom_error_message.dart';
import 'package:books/features/home/presentation/views/widgets/newestBooks_listview_item.dart';
import 'package:books/features/seacrh/presentation/manager/cubits/search_books_cubit/search_books_cubit.dart';
import 'package:books/features/seacrh/presentation/manager/cubits/search_books_cubit/search_books_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListview extends StatelessWidget {
  const SearchResultListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksStates>(
      builder: (context, state) {
        if (state is SearchBooksLoadingState) {
          return ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: BookItemShimmer(),
              );
            },
          );
        } else if (state is SearchBooksFailureState) {
          return CustomErrorMessage(errorMessage: state.errorMessage);
        } else if (state is SearchBooksSuccessState) {
          if (state.books.isEmpty) {
            return const CustomErrorMessage(
              errorMessage: 'No books found for your search',
            );
          }
          return ListView.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: NewestbooksListviewItem(bookModel: state.books[index]),
              );
            },
          );
        }
        return const Center(
          child: Text(
            'Start typing to search books',
            style: TextStyle(
              color: Color(0xff9CA3AF),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      },
    );
  }
}
