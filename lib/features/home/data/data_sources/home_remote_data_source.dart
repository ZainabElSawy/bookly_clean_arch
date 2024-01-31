import 'package:bookly_clean_arch/core/utils/api_service.dart';
import 'package:bookly_clean_arch/core/utils/constant.dart';
import 'package:bookly_clean_arch/features/home/data/model/book_model/book_model.dart';

import '../../../../core/utils/functions/save_books.dart';
import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchSimilarBooks();
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImp(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    Map<String, dynamic> data = await apiService.get(
        endPoint:
            "volumes?q=programming&Filtering=free-ebooks&startIndex=${pageNumber * 10}");
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    Map<String, dynamic> data = await apiService.get(
        endPoint:
            "volumes?q=programming&Filtering=free-ebooks&sorting=newest&startIndex=${pageNumber * 10}");
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kNewestBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks() async {
    Map<String, dynamic> data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=subject:programming&Sorting=relevance');
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data["items"]) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
