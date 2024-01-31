
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/domain/use_cases/fetch_book_details_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.fetchBookDetailsUseCase) : super(SimilarBooksInitial());
  final FetchBookDetailsUseCase fetchBookDetailsUseCase;
  Future<void> fetchSimislarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await fetchBookDetailsUseCase.call(category);
    result.fold((failure) {
      emit(SimilarBooksFailure(failure.errMessage));
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
