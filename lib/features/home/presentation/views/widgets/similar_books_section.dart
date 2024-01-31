import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'similar_books_list_view.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("You can also like", style: Styles.textStyle14),
        SizedBox(height: 16),
        SimilarBooksListView(),
      ],
    );
  }
}
