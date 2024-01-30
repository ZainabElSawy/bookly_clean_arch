import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../data/model/book_model/book_model.dart';
import 'widgets/book_details_view_body.dart';

class BookDetailsView extends StatefulWidget {
  final BookModel book;
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
        .fetchSimislarBooks(category: widget.book.volumeInfo!.categories![0]);
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
