import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'custom_book_image.dart';

class BookListViewItem extends StatelessWidget {
  final BookEntity book;
  const BookListViewItem({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: book);
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        height: 135,
        child: Row(
          children: [
            CustomBookImage(
              imageUrl: book.image ?? '',
              borderRadius: BorderRadius.circular(8),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      book.title,
                      style: Styles.textStyle20
                          .copyWith(fontFamily: kGtSectraFine),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      book.autherName ?? '',
                      style: Styles.textStyle14,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Free",
                          style: Styles.textStyle20
                              .copyWith(fontWeight: FontWeight.bold)),
                      BookRating(
                        raiting: book.rating ?? 0,
                        count: 5,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
