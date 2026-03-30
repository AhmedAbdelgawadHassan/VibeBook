  import 'package:books/core/errors/failures.dart';
import 'package:books/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
    Future<Either<Failures, List<BookModel>>> searchBooks({required String query});
}