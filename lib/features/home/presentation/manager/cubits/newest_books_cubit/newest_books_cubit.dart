import 'package:bloc/bloc.dart';
import 'package:books/features/home/data/repos/home_repo.dart';
import 'package:books/features/home/presentation/manager/cubits/newest_books_cubit/newest_books_states.dart';

class NewestBooksCubit extends Cubit<NewestBooksStates>{
  NewestBooksCubit(super.initialState, {required this.homeRepo});
  final HomeRepo homeRepo;
  Future<void> fetchNewestBooks() async{
    emit(NewestBooksLoadingState());
    var result =await homeRepo.fetchNewestBooks();
return  result.fold((failure) =>emit(NewestBooksFailureState(errorMessage: failure.errorMessage)) ,
     (books) => emit(NewestBooksSuccessState(book: books)),);
  }

}