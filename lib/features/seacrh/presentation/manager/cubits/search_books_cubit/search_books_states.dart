import 'package:books/features/home/data/models/book_model/book_model.dart';

class SearchBooksStates {}

class SearchBooksInitialState extends SearchBooksStates {}

class SearchBooksLoadingState extends SearchBooksStates {}

class SearchBooksSuccessState extends SearchBooksStates {
  final List<BookModel> books;

  SearchBooksSuccessState({required this.books});
}

class SearchBooksFailureState extends SearchBooksStates {
  final String errorMessage;

  SearchBooksFailureState({required this.errorMessage});
}
