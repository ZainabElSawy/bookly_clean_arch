import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../data/model/book_model/book_model.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  final BookModel book;
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
            imageUrl: book.volumeInfo?.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(height: 38),
        Text(
          book.volumeInfo?.title ?? '',
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.volumeInfo?.authors?[0] ?? '',
            style: Styles.textStyle18.copyWith(fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(height: 15),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          raiting: book.volumeInfo?.averageRating ?? 0,
          count: book.volumeInfo?.ratingsCount ?? 0,
        ),
        const SizedBox(height: 32),
        BooksAction(book: book,),
      ],
    );
  }
}
