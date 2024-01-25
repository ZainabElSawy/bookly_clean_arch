import 'package:bookly_clean_arch/core/utils/api_service.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchNewestBooks();
  List<BookEntity> fetchFeaturedBooks();
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  final ApiService apiService;

  HomeLocalDataSourceImp(this.apiService);

  @override
  List<BookEntity> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}
