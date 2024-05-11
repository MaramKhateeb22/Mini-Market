import 'package:flutter/material.dart';
import '/Feature/auth/presentaion/views/widget/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SignInViewBody() ,
    );
  }
}
