import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/Feature/product/data/data/model/all_product_model.dart';

import 'widget/detail_product_view_body.dart';

class DetailProductView extends StatelessWidget {
 final AllProductMdel product;
   DetailProductView({required this.product});

  @override
  Widget build(BuildContext context) {
    return DetailProductViewBody(product: product,);
  }
}
