import 'package:bloc/bloc.dart';
import 'package:books/features/home/data/repos/home_repo.dart';
import 'package:books/features/seacrh/presentation/manager/cubits/search_books_cubit/search_books_states.dart';

class SearchBooksCubit extends Cubit<SearchBooksStates> {
  SearchBooksCubit(super.initialState, {required this.homeRepo});

  final HomeRepo homeRepo;

  Future<void> searchBooks({required String query}) async {
    if (query.trim().isEmpty) {
      emit(SearchBooksInitialState());
      return;
    }
    emit(SearchBooksLoadingState());
    final result = await homeRepo.searchBooks(query: query.trim());
    result.fold(
      (failure) =>
          emit(SearchBooksFailureState(errorMessage: failure.errorMessage)),
      (books) => emit(SearchBooksSuccessState(books: books)),
    );
  }
}
