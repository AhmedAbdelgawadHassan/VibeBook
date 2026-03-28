import 'package:books/features/home/data/models/book_model/book_model.dart';

 class FeaturedBooksState{}
 class FeaturedBooksInitialState extends FeaturedBooksState{}
 class FeaturedBooksLoadingState extends FeaturedBooksState{}
 class FeaturedBooksSuccessState extends FeaturedBooksState{
  final List<BookModel> books;

  FeaturedBooksSuccessState({required this.books});

}
 class FeaturedBooksFailureState extends FeaturedBooksState{
  final String errorMessage;
  FeaturedBooksFailureState({required this.errorMessage});
}