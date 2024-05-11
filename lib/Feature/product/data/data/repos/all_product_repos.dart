import 'package:dartz/dartz.dart';

import '/core/utils/api/api_consumer.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/utils/api/end_ponits.dart';
import '../model/all_product_model.dart';

// class AllProductRepository{
//   final ApiConsumer api;
//
//   AllProductRepository({required this.api});
//   Future<Either<String, AllProductMdel>> allProduct() async {
//     try {
//       final response = await api.get(
//         EndPoint.allProducts,
//       );
//       final products = AllProductMdel.fromJson(response);
//       List<AllProductMdel> productList =[];
//       for(int i=0;i<response.length;i++){
//     productList.add(AllProductMdel.fromJson(response[i]));
//     print("555555555555555555555555555 ${productList[i].category}");
//
//     }
//       print("555555555555555555555555555 ${productList[1].category}");
//
//       print(products);
//       return Right(products);
//     } on ServerException catch (e) {
//       return Left(e.errModel.errorMessage);
//     }}
//
//
//
// }

class AllProductRepository {
  final ApiConsumer api;

  AllProductRepository({required this.api});

  Future<Either<String, List<AllProductMdel>>> allProduct() async {
    try {
      final response = await api.get(EndPoint.allProducts);


      if (response is List) {
        final productList = response.map((productData) => AllProductMdel.fromJson(productData)).toList();


        print("Category of first product is ${productList[0].category}");

        return Right(productList);
      } else {
        // هنا يجب معالجة الحالة التي الاستجابة ليست قائمة
        return Left('Expected a list but got ${response.runtimeType}');
      }
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
