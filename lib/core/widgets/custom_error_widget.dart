import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomErrorMessage extends StatelessWidget {
  final String errMessage;
  const CustomErrorMessage({
    Key? key,
    required this.errMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errMessage, style: Styles.textStyle18));
  }
}
