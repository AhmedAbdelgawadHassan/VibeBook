import 'package:books/core/widgets/book_item_shimmer.dart';
import 'package:books/core/widgets/custom_error_message.dart';
import 'package:books/features/home/presentation/manager/cubits/newest_books_cubit/newest_books_cubit.dart';
import 'package:books/features/home/presentation/manager/cubits/newest_books_cubit/newest_books_states.dart';
import 'package:books/features/home/presentation/views/widgets/newestBooks_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestbooksListview extends StatelessWidget {
  const NewestbooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksStates>(
      builder: (context, state) {
        if (state is NewestBooksLoadingState) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return const BookItemShimmer();
            },
          );
        } else if (state is NewestBooksSuccessState) {
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.book.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: NewestbooksListviewItem(bookModel: state.book[index]),
              );
            },
          );
        } else if (state is NewestBooksFailureState) {
          return CustomErrorMessage(errorMessage: state.errorMessage);
        } else {
          return Center(
            child: const CustomErrorMessage(
              errorMessage: 'There was an error , Please try again',
            ),
          );
        }
      },
    );
  }
}
