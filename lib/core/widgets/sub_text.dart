import 'package:flutter/material.dart';
import '/core/utils/styles.dart';

class SubText extends StatelessWidget {
  const SubText({super.key, required this.subTitle});
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Text(subTitle,style: Styles.style18,));
  }
}