import 'package:books/core/widgets/book_item_shimmer.dart';
import 'package:books/core/widgets/custom_error_message.dart';
import 'package:books/features/home/presentation/manager/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:books/features/home/presentation/manager/cubits/featured_books_cubit/featured_books_states.dart';
import 'package:books/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class FeaturedBooksListview extends StatelessWidget {
  const FeaturedBooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
       if(state is FeaturedBooksLoadingState){
        return  ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return const BookItemShimmer();
        },
      );;
       }
       else if (state is FeaturedBooksSuccessState){
        return ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        itemCount:state.books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 12),
            child: CustomBookImage(
              bookImage: state.books[index].volumeInfo.imageLinks.thumbnail
              // bookImage: state.books[index].items,
            ),
          );
        },
      );
    
       }
       else if (state is FeaturedBooksFailureState){
        return CustomErrorMessage(errorMessage: state.errorMessage);
       }
       else{
        return Center(child: const CustomErrorMessage(errorMessage: 'There was an error , Please try again'));
       }
      },
    );
  }}