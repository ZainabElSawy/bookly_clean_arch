import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import 'custom_book_image.dart';

class FeaturedBooksListView extends StatefulWidget {
  final List<BookEntity> books;
  const FeaturedBooksListView({
    super.key,
    required this.books,
  });

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  late ScrollController scrollController;
  int nextPage = 1;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  void _scrollListener() async {
    double currentPosition = scrollController.position.pixels;
    double maxScrollLength = scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        await BlocProvider.of<FeaturedBooksCubit>(context)
            .fetchFeaturedBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kBookDetailsView,
                    extra: widget.books[index]);
              },
              child: CustomBookImage(
                imageUrl: widget.books[index].image,
              ),
            ),
          );
        },
      ),
    );
  }
}
