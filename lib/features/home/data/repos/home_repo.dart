import 'package:books/core/errors/failures.dart';
import 'package:books/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookModel>>> featchFeaturedBooks();
  Future<Either<Failures, List<BookModel>>> fetchNewestBooks();
  Future<Either<Failures, List<BookModel>>> fetchSimilarBooks({
    required String category,
  });
  Future<Either<Failures, List<BookModel>>> searchBooks({
    required String query,
  });
}
