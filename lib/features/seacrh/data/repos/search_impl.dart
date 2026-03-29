import 'package:books/core/errors/failures.dart';
import 'package:books/core/services/api_services.dart';
import 'package:books/features/home/data/models/book_model/book_model.dart';
import 'package:books/features/seacrh/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiServices apiServices;

  SearchRepoImpl({required this.apiServices});
  @override
  Future<Either<Failures, List<BookModel>>> searchBooks({required String query}) async{

    try {
      final encodedQuery = Uri.encodeQueryComponent(query);
      final data = await apiServices.get(
        'volumes?q=$encodedQuery&Filtering=free_ebooks&Sorting=relevance',
      );
      final List<BookModel> books = [];
      if (data["items"] != null) {
        for (var item in data["items"]) {
          books.add(BookModel.fromJson(item));
        }
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}

  