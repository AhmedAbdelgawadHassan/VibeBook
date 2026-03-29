import 'package:books/features/home/data/models/book_model/book_model.dart';

class SimilarBooksState {}
class SimilarBooksInitialState extends SimilarBooksState {}
class SimilarBooksLoadingState extends SimilarBooksState {}
class SimilarBooksSuccessState extends SimilarBooksState {
  final List<BookModel> books;

  SimilarBooksSuccessState({required this.books});
}
class SimilarBooksFailureState extends SimilarBooksState {
  final String errorMessage;

  SimilarBooksFailureState({required this.errorMessage});
}