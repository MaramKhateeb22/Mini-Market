import 'package:flutter/material.dart';

import '../utils/styles.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return  Expanded(child: Text("$title :",style: Styles.style22g,));
  }
}