import 'package:bloc/bloc.dart';
import 'package:books/features/home/data/repos/home_repo.dart';
import 'package:books/features/home/presentation/manager/cubits/similar_books_cubit/similar_books_states.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState>{
  SimilarBooksCubit(super.initialState, {required this.homeRepo});
     final  HomeRepo homeRepo   ;


  Future<void> fetchSimilarBooks({required String category}) async{
    emit(SimilarBooksLoadingState());

   var result= await homeRepo.fetchSimilarBooks(category: category);
  return result.fold((failure) => emit(SimilarBooksFailureState(errorMessage: failure.errorMessage)),
    (books) =>emit(SimilarBooksSuccessState(books: books)),);
}}