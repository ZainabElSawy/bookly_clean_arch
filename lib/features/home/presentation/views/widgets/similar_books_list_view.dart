
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';

// import '../../../../../core/utils/app_router.dart';
// import '../../../../../core/widgets/custom_error_widget.dart';
// import '../../../../../core/widgets/custom_loading_indicator.dart';
// import '../../view_models/similar_books_cubit/similar_books_cubit.dart';
// import 'custom_book_image.dart';

// class SimilarBooksListView extends StatelessWidget {
//   const SimilarBooksListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
//       builder: (context, state) {
//         if (state is SimilarBooksSuccess) {
//           return SizedBox(
//             height: MediaQuery.of(context).size.height * 0.14,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: state.books.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.only(right: 10.0),
//                   child: GestureDetector(
//                     onTap: () {
//                       GoRouter.of(context).push(AppRouter.kBookDetailsView,
//                           extra: state.books[index]);
//                     },
//                     child: CustomBookImage(
//                       imageUrl: state
//                               .books[index].volumeInfo?.imageLinks?.thumbnail ??
//                           '',
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         } else if (state is SimilarBooksFailure) {
//           return CustomErrorMessage(errMessage: state.errMessage);
//         } else {
//           return const CustomLoadingIndicator();
//         }
//       },
//     );
//   }
// }
