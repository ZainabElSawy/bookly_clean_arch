import 'package:bookly_clean_arch/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_clean_arch/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_clean_arch/features/home/domain/repos/home_repo.dart';
import 'package:bookly_clean_arch/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repos/home_repo_imp.dart';
import '../../features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRemoteDataSource>(
      HomeRemoteDataSourceImp(getIt.get<ApiService>()));
  getIt.registerSingleton<HomeLocalDataSource>(
      HomeLocalDataSourceImp(getIt.get<ApiService>()));

  getIt.registerSingleton<HomeRepo>(HomeRepoImp(
      homeRemoteDataSource: getIt.get<HomeRemoteDataSource>(),
      homeLocalDataSource: getIt.get<HomeLocalDataSource>()));
  getIt.registerSingleton<FetchFeaturedBooksUseCase>(
      FetchFeaturedBooksUseCase(homeRepo: getIt.get<HomeRepo>()));
  getIt.registerSingleton<FetchNewestBooksUseCase>(
      FetchNewestBooksUseCase(homeRepo: getIt.get<HomeRepo>()));
}
