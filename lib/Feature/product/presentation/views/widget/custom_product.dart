import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '/Feature/cart/presentation/views/widget/add_to_cart_button.dart';
import '/Feature/product/data/data/model/all_product_model.dart';

class CustomProductWidget extends StatefulWidget {
   CustomProductWidget({required this.product});
AllProductMdel product;
  @override
  State<CustomProductWidget> createState() => _CustomProductWidgetState();
}

class _CustomProductWidgetState extends State<CustomProductWidget> {
  bool onChange=false;

  @override
  Widget build(BuildContext context) {
    double iconSize = MediaQuery.of(context).size.width / 18;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              height: 150,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [

                       Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Expanded(
                          child: Text(
                            style:const  TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          
                            widget.product.title!.substring(0, 6),
                          ),
                        ),
                        Spacer(flex: 2,),
                        Expanded(
                          child: Text(
                          
                            r'$' '${widget.product.price}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),


                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: IconButton(
                              onPressed: () async{
                                context.push('/detail_product_view',extra: widget.product);
                              },
                              icon: Icon(
                                Icons.arrow_circle_left_outlined,
                                size: 25.sp,
                                color: Colors.green,
                              )),
                        ),
                        Spacer(flex: 1,),
                        AddToCartButton(item: widget.product),



                        // IconButton(
                        //     onPressed: () {
                        //
                        //       setState(() {
                        //         onChange = !onChange;
                        //       });
                        //     },
                        //     icon: Icon(
                        //        Icons.add_shopping_cart_sharp,
                        //
                        //       size: iconSize,
                        //     ),),


                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            top: -20,
            child: Image.network(
              '${widget.product.image}',
              height: 100,
              width: 80,
            ),
          )
        ],
      ),

    );
  }
}
