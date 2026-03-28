import 'package:books/features/home/data/models/book_model/book_model.dart';

class NewestBooksStates {}
class NewestBooksInitialState extends NewestBooksStates {}
class NewestBooksLoadingState extends NewestBooksStates {}
class NewestBooksSuccessState extends NewestBooksStates {
  final List<BookModel> book;

  NewestBooksSuccessState({required this.book});
}
class NewestBooksFailureState extends NewestBooksStates {
   final String errorMessage;

  NewestBooksFailureState({required this.errorMessage});
}