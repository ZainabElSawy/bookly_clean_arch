import 'package:bookly_clean_arch/core/errors/failure.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure,List<BookEntity>>> fetchFeaturedBooks({int pageNumber=0});
  Future<Either<Failure,List<BookEntity>>> fetchNewestBooks();
  //   Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category});
}
