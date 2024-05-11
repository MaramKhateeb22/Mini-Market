import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import '/Feature/auth/data/models/user_model.dart';

import '/Feature/auth/data/repos/user_repo.dart';
import '/Feature/auth/presentaion/manager/cubit/user_state.dart';

import '../../../../../core/cache_helper/cache_helper.dart';


class UserCubit extends Cubit<userState> {
  UserCubit(this.userRepository, ) : super(InitialState()) {}
final UserRepository userRepository;
  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInName = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();

  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();

  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();

  UserModel? userProfile;
  signIn({required String userName,required String pAssword}) async {
    emit(SiginInLoading());
    final response = await userRepository.signIn(
      username:userName,
      password: pAssword,
      // signInPassword.text,
    );
    response.fold(
          (errMessage) => emit(SiginInFailure(errMessage: errMessage)),
          (signInModel) async{

            final result = await cacheHelper
                .setUser(User(name:userName, ));
            emit(SiginInSuccess());
        }
    );
  }

  getUserProfile() async {
    emit(GetUserLoading());
    final response = await userRepository.getUserProfile();
    response.fold(
          (errMessage) => emit(GetUserFailure(errMessage: errMessage)),
          (user) {
  userProfile=user;
            emit(GetUserSuccess())
            ;
          }
    );
  }

//
  // Future<Either<String, SiginInModel>> signIn({
  //
  //   required String username,
  //   required String password,
  // }) async {
  //   try {
  //     final response = await api.post(
  //       EndPoint.signIn,
  //       data: {
  //         ApiKey.username: username,
  //         ApiKey.password: password,
  //       },
  //     );
  //     final user = SiginInModel.fromJson(response);
  //     // final decodedToken = JwtDecoder.decode(user.token);
  //     // CacheHelper().saveData(key: ApiKey.token, value: user.token);
  //     // CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
  //     return Right(user);
  //   } on ServerException catch (e) {
  //     return Left(e.errModel.errorMessage);
  //   }
  // }


}


