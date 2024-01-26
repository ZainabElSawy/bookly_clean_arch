import 'package:bookly_clean_arch/core/utils/api_service.dart';
import 'package:bookly_clean_arch/core/utils/constant.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
    Box<BookEntity> box = Hive.box<BookEntity>(kFeaturedBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
     Box<BookEntity> box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}
