import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/Feature/product/presentation/manager/cubit/all_product_state.dart';

import '../../../data/data/model/all_product_model.dart';
import '../../manager/cubit/all_product_cubit.dart';
import 'custom_product.dart';

class AllProductViewBody extends StatelessWidget {
  const AllProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {


        return   Scaffold(
          body: FutureBuilder<dynamic>(
            future: context.read<AllProductubit>().allProduct(), // الوظيفة التي تحصل على البيانات من API
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {

                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {

                return Center(child: Text('حدث خطأ: ${snapshot.error}'));
              } else {

                List<AllProductMdel>? products = context.read<AllProductubit>().allProductMdel;

                return
                  GridView.builder(
                    clipBehavior: Clip.none,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,


                          childAspectRatio: 1.5,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 1,),
                  itemCount: products!.length,
                  itemBuilder: (context, index) {
                    AllProductMdel product = products[index];
                    return CustomProductWidget(product:product);
                  },
                );
              }
            },
          ),






        );

  }
}
