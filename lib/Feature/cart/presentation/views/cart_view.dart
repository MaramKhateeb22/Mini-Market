import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/Feature/cart/presentation/views/widget/cart-view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:CartViewBody() ,
    );
  }
}
