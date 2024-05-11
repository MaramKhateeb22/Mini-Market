import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:go_router/go_router.dart';
import '/core/utils/styles.dart';

import '../../../data/models/all_carts_model.dart';


class CustomProductCart extends StatelessWidget {
   CustomProductCart({super.key,required this.item });
   AllCartsModel item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,
      vertical: 10),
      child: InkWell(
        onTap: ()async{

          context.push('/custom_one_cart',extra: item);
        },
        child: Card(
          elevation: 5,
          child: Container(
           height: 50,
            decoration: BoxDecoration(color: Colors.cyan,
                borderRadius: BorderRadius.circular(5)),
            child:


              Center(
                child: Text(
                    'Cart ${item.id}',style: Styles.style22w,
                ),
              ),



          ),
        ),
      ),
    );
  }
}
