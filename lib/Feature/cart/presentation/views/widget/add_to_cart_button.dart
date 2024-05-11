
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../product/data/data/model/all_product_model.dart';
import '../../manager/provider/cart_provider.dart';

class AddToCartButton extends StatelessWidget {
  final AllProductMdel item;

  const AddToCartButton({required this.item});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderCart>(
      builder: (BuildContext context, value, Widget? child) {
        var isInCart = value.items.contains(item);

        return IconButton(
          onPressed: isInCart
              ? null
              : () {
            var cart = Provider.of<ProviderCart>(context, listen: false);
            cart.add(item);
          },
          icon: isInCart
              ? const Icon(Icons.check, semanticLabel: 'ADDED')
              : const  Icon(Icons.add_shopping_cart_sharp,)
        );
      },
    );
  }
}
