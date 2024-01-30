import 'package:bookly_clean_arch/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_clean_arch/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/repos/home_repo.dart';

class HomeRepoImp implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  HomeRepoImp({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0}) async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
      if (books.isNotEmpty) return right(books);
      books =
          await homeRemoteDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
      return right(books);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchNewestBooks();
      if (books.isNotEmpty) return right(books);
      books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  // @override
  // Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category})async {
  //   try {
  //     Map<String, dynamic> data = await apiService.get(
  //         endPoint: 'volumes?Filtering=free-ebooks&q=subject:programming&Sorting=relevance');
  //     List<BookModel> books = [];
  //     for (var book in data['items']) {
  //       books.add(BookModel.fromJson(book));
  //     }
  //     return right(books);
  //   } catch (e) {
  //     // ignore: deprecated_member_use
  //     if (e is DioError) {
  //       return left(ServerFailure.fromDioError(e));
  //     }
  //     return left(ServerFailure(e.toString()));
  //   }
  // }
}
