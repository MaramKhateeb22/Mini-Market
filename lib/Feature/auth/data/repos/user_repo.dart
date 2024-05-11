import 'package:dartz/dartz.dart';

import '/core/utils/api/api_consumer.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../../../core/cache_helper/cache_helper.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/api/end_ponits.dart';
import '../models/sigin_in_model.dart';
import '../models/user_model.dart';

class UserRepository{
  final ApiConsumer api;

  UserRepository({required this.api});
  Future<Either<String, SiginInModel>> signIn({

    required String username,
    required String password,
  }) async {
    try {
      final response = await api.post(
        EndPoint.signIn,
        data: {
          ApiKey.username: username,
          ApiKey.password: password,
        },
      );
      final user = SiginInModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user.token!);
      cacheHelper.saveData(key: ApiKey.token, value: user.token);


      cacheHelper.saveData(key: ApiKey.id, value: decodedToken["sub"]);
      return Right(user);
    } on
    // DioException catch (e) {
    //   if (e.response != null) {
    //     // إذا كانت الاستجابة تحتوي على هذه الرسالة، فمن المحتمل أن تكون وصلت إلى هذا جزء من الكود
    //     print("Response Text:");
    //     print(e.response!.data);
    //     return Left('${e.response!.data}');
    //   } else {
    //     // هنا يتم التعامل مع الخطأ إذا لم تكن هناك استجابة
    //     print(e.message);
    //     return Left('$e.message');
    //
    //   }
    // }
    ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }}


  Future<Either<String, UserModel>> getUserProfile() async {
    try {
      final response = await api.get(
        EndPoint.getUserDataEndPoint(

          cacheHelper.getData(key: ApiKey.id),
        ),
      );
      return Right(UserModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

}