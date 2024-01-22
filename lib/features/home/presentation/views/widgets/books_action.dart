import 'package:flutter/material.dart';


import '../../../../../core/utils/functions/launcher_url.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../data/model/book_model/book_model.dart';

class BooksAction extends StatelessWidget {
  final BookModel book;
  const BooksAction({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
              child: CustomButton(
            onPressed: () async {
              launchCustomUrl(
                  context, book.accessInfo?.pdf?.acsTokenLink);
            },
            text: "Free",
            textColor: Colors.black,
            backgroundColor: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
          )),
          Expanded(
              child: CustomButton(
            onPressed: () async {
              launchCustomUrl(context, book.volumeInfo?.previewLink);
            },
            fontSize: 16,
            text: getText(book),
            backgroundColor: const Color(0xffEf8262),
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16)),
          )),
        ],
      ),
    );
  }

  String getText(BookModel book) {
    if (book.volumeInfo?.previewLink == null) {
      return "Not Available";
    } else {
      return "Preview";
    }
  }
}
