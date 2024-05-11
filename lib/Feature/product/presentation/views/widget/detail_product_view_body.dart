import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/core/utils/styles.dart';
import '/core/widgets/custom_app_bar.dart';

import '../../../data/data/model/all_product_model.dart';

class DetailProductViewBody extends StatelessWidget {
  final AllProductMdel product;
   DetailProductViewBody({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:buildAppBar(title: 'Details'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(

                  image: NetworkImage("${product.image}"),height: 200,),
              const  SizedBox(height: 15,),
                Text("${product.title}",style: Styles.style22g,),
                const  SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Price:",style: Styles.style18,),
                    Text("${product.price} "   r'$',style: Styles.style22,),
                  ],
                ),
                const  SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Categoty:",style: Styles.style18,),
                    Text("${product.category}  ",style: Styles.style22,),
                  ],
                ), const  SizedBox(height: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Description:",style: Styles.style18,),
                  const  SizedBox(height: 4,),
                  Text("${product.description}",style: Styles.style20,),
                ],
              ),
                const  SizedBox(height: 15,),
                Column(children: [
                  Text("Rating",style: Styles.style22p,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text("Rate:",style: Styles.style18,),
                    Text("${product.rating!.rate}",style: Styles.style22,),
                  ],),
                  const  SizedBox(height: 7,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                    Text("Count:",style: Styles.style18,),
                    Text("${product.rating!.count}",style: Styles.style22,),
                  ],)

                ],)






              ],
            ),
          ),
        ),
      )
    );
  }
}
