import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/similar_books_cubit/similar_books_cubit.dart';
import 'widgets/book_details_view_body.dart';

class BookDetailsView extends StatefulWidget {
  final BookEntity book;
  const BookDetailsView({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SimilarBooksCubit>(context)
        .fetchSimislarBooks(category: "");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BookDetailsViewBody(book: widget.book),
      ),
    );
  }
}
