import 'package:flutter/material.dart';
import '/Feature/product/presentation/views/widget/all_product_view_body.dart';

class AllProductView extends StatelessWidget {
  const AllProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AllProductViewBody(),
    );
  }
}
