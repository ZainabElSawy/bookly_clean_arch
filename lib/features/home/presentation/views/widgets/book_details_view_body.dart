import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import 'book_details_section.dart';
import 'custom_book_details_appbar.dart';
import 'similar_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  final BookEntity book;
  const BookDetailsViewBody({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                BookDetailsSection(book: book),
                const Expanded(child: SizedBox(height: 45)),
                const SimilarBooksSection(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        )
      ],
    );
  }
}
