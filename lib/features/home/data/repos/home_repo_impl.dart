import 'package:books/core/errors/failures.dart';
import 'package:books/core/services/api_services.dart';
import 'package:books/features/home/data/models/book_model/book_model.dart';
import 'package:books/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo{
 final ApiServices apiServices;
  HomeRepoImpl({required this.apiServices});
  
  
  @override
  Future<Either<Failures, List<BookModel>>> fetchNewestBooks() async {
    try {
  var data = await apiServices.get('volumes?q=subject:computer science&Filtering=free_ebooks');
   List<BookModel> books=[];
  for(var item in data["items"]){
    books.add(BookModel.fromJson(item));
  }
  return right(books);
  
} on Exception catch (e) {
  if(e is DioException){
    return left(ServerFailure.fromDioException(e));
  }
  return left(ServerFailure(errorMessage: e.toString()));
  
}

  }

  @override
   Future<Either<Failures, List<BookModel>>> featchFeaturedBooks()async {
    try {
  var data = await apiServices.get('volumes?q=subject:programming&Filtering=free_ebooks');
   List<BookModel> books=[];
  for(var item in data["items"]){
    books.add(BookModel.fromJson(item));
  }
  // print("no of books ${books.length}");
  return right(books);
} on Exception catch (e) {
  if(e is DioException){
    return left(ServerFailure.fromDioException(e));
  }
  return left(ServerFailure(errorMessage: e.toString()));
}
  }
  
  @override
  Future<Either<Failures, List<BookModel>>> fetchSimilarBooks({required String category}) async {

    try {
  var data = await apiServices.get('volumes?q=subject:programming&Filtering=free_ebooks&Sorting=relevance');
   List<BookModel> books=[];
  for(var item in data["items"]){
    books.add(BookModel.fromJson(item));
  }
  return right(books);
  
} on Exception catch (e) {
  if(e is DioException){
    return left(ServerFailure.fromDioException(e));
  }
  return left(ServerFailure(errorMessage: e.toString()));
  
}

  }
    
  }

