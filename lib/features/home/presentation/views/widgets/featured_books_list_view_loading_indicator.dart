import 'package:bookly_clean_arch/core/widgets/custom_fading_widget.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/custom_book_image_loading_indicator.dart';
import 'package:flutter/material.dart';

class FeaturedBooksListViewLoadingIndicator extends StatelessWidget {
  const FeaturedBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: CustomBookImageLoadingIndicator(),
            );
          },
        ),
      ),
    );
  }
}
