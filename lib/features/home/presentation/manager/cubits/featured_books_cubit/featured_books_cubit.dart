import 'package:bloc/bloc.dart';
import 'package:books/features/home/data/repos/home_repo.dart';
import 'package:books/features/home/presentation/manager/cubits/featured_books_cubit/featured_books_states.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState>{
  FeaturedBooksCubit(super.initialState, {required this.homeRepo});
   final  HomeRepo homeRepo   ;


  Future<void> featchFeaturedBooks() async{
    emit(FeaturedBooksLoadingState());

   var result= await homeRepo.featchFeaturedBooks();
  return result.fold((failure) => emit(FeaturedBooksFailureState(errorMessage: failure.errorMessage)),
    (books) =>emit(FeaturedBooksSuccessState(books: books)),);

  }


}