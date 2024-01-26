import 'package:bookly_clean_arch/features/home/data/model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../repos/home_repo.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookModel>, NoParam> {
  final HomeRepo homeRepo;
  FetchNewestBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookModel>>> call([NoParam? param]) async {
    return await homeRepo.fetchNewestBooks();
  }
}

