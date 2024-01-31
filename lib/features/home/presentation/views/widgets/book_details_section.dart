import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  final BookEntity book;
  const BookDetailsSection({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.23),
          child: CustomBookImage(
            imageUrl: book.image ?? '',
          ),
        ),
        const SizedBox(height: 38),
        Text(
          book.title,
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.autherName ?? '',
            style: Styles.textStyle18.copyWith(fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(height: 15),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          raiting: book.rating ?? 0,
          count: 452,
        ),
        const SizedBox(height: 32),
        BooksAction(
          book: book,
        ),
      ],
    );
  }
}
