import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../repos/home_repo.dart';

class FetchBookDetailsUseCase extends UseCase<List<BookEntity>, String> {
  final HomeRepo homeRepo;
  FetchBookDetailsUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([String param=""]) async {
    return await homeRepo.fetchSimilarBooks(category: param);
  }
}
