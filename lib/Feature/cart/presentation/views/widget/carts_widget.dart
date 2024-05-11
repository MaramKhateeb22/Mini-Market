

import 'package:flutter/material.dart';

import '../../../../../core/widgets/sub_text.dart';
import '../../../data/models/get_single_product.dart';

class CartsWidget extends StatelessWidget {
  CartsWidget({super.key,required this.item});
  GetSingleProduct item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        elevation: 4,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
              color: Colors.white),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image(image: NetworkImage('${item.image}',),height: 70,),
              ),

              SubText(subTitle: '${item.title?.substring(0,6)}'),
              SubText(subTitle: "${item.price}"),


            ],
          ) ,
        ),
      ),
    );
  }
}
