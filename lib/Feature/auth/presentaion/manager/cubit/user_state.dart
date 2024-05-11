import '../../../data/models/user_model.dart';

abstract class userState {}

class InitialState extends userState {}

class SiginInLoading extends userState {}

class SiginInSuccess extends userState {}


class SiginInFailure extends userState {
  final String errMessage;

  SiginInFailure({required this.errMessage});
}
class GetUserLoading extends userState {}
class GetUserSuccess extends userState {


}
class GetUserFailure extends userState {
  final String errMessage;

  GetUserFailure({required this.errMessage});

}