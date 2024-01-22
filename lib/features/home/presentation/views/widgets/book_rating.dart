import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../../../../../core/utils/styles.dart';

// ignore: must_be_immutable
class BookRating extends StatelessWidget {
  MainAxisAlignment mainAxisAlignment;
  final num raiting;
  final int count;
  BookRating({
    Key? key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.raiting,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          size: 14,
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(width: 6.3),
        Text(
          "$raiting",
          style: Styles.textStyle16,
        ),
        const SizedBox(width: 5),
        Opacity(
          opacity: 0.5,
          child: Text(
            "($count)",
            style: Styles.textStyle14,
          ),
        ),
      ],
    );
  }
}
