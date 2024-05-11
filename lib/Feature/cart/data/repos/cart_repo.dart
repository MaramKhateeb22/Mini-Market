
import 'package:dartz/dartz.dart';
import '/Feature/cart/data/models/all_carts_model.dart';

import '../../../../core/cache_helper/cache_helper.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/api/api_consumer.dart';
import '../../../../core/utils/api/end_ponits.dart';
import '../models/cart_user_model.dart';
import '../models/get_single_product.dart';

class CartRepository{
  final ApiConsumer api;

  CartRepository({required this.api});
  Future<Either<String, CartUserModel>> getUserCart() async {
    try {
      final response = await api.get(
        EndPoint.getUserCartEndPoint(  cacheHelper.getData(key: ApiKey.id),),

      );
      return Right(CartUserModel.fromJson(response));

    } on

    ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }}

  Future<Either<String, List<AllCartsModel>>> getAllCart() async {
    try {
      final response = await api.get(
        EndPoint.allCarts,

      );



      if (response is List) {
        final cartList = response.map((productData) =>
        AllCartsModel.fromJson(productData)).toList();

        // تطبع فئة المنتج الأول للتحقق
        print("==========one of first product is ${cartList[0].products![0]
            .quantity}");

        return Right(cartList);
      }
      else {

        return Left('Expected a list but got ${response.runtimeType}');
      }

    } on

    ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }}



  Future<Either<String, GetSingleProduct>> getSingleProduct({required int id}) async {
    try {
      final response = await api.get(
        EndPoint.getSingleProductEndPoint(id),
      );
      return Right(GetSingleProduct.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

}