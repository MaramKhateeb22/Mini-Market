import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/styles.dart';

class CustomTextButtonGradient extends StatelessWidget {
  CustomTextButtonGradient({ this.nextPage,required this.text});
  String? nextPage;
  String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // context.go(nextPage!);
      },
      child: ShaderMask(
        shaderCallback: (bounds) {
          return LinearGradient(
            colors: [Colors.blue, Colors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds);
        },
        blendMode: BlendMode.srcIn,
        child: Text(
          '$text',
          style: Styles.style18.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
