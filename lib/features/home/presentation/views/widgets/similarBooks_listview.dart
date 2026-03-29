import 'package:books/core/services/service_locator.dart';
import 'package:books/core/widgets/book_item_shimmer.dart';
import 'package:books/core/widgets/custom_error_message.dart';
import 'package:books/features/home/data/repos/home_repo_impl.dart';
import 'package:books/features/home/presentation/manager/cubits/similar_books_cubit/similar_books_cubit.dart';
import 'package:books/features/home/presentation/manager/cubits/similar_books_cubit/similar_books_states.dart';
import 'package:books/features/home/presentation/views/book_datails_view.dart';
import 'package:books/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarbooksListview extends StatelessWidget {
  const SimilarbooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksLoadingState) {
          return ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return const BookItemShimmer();
            },
          );
        } else if (state is SimilarBooksSuccessState) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 12),
                  child: InkWell(
                    onTap: () {
                        Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => SimilarBooksCubit(
                          SimilarBooksInitialState(),
                          homeRepo: getIt.get<HomeRepoImpl>(),
                        ),
                        child: BookDatailsView(bookModel: state.books[index]),
                      ),
                    ),
                  );
                    },
                    child: CustomBookImage(
                      bookImage:state.books[index].volumeInfo.imageLinks.thumbnail,
                          
                      // bookImage: state.books[index].items,
                    ),
                  ),
                );
              
            },
          );
        } else if (state is SimilarBooksFailureState) {
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
