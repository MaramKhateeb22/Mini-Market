abstract class CartState {}
class InitialCartState extends CartState{}
class LoadingCartState extends CartState{}
class SuccessCartState extends CartState{}
class FailureCartState extends CartState{
  final String errMessage;

  FailureCartState({required this.errMessage});
}
class LoadingAllCartsState extends CartState{}
class SuccessAllCartsState extends CartState{}
class FailureAllCartsState extends CartState{
  final String errMessage;

  FailureAllCartsState({required this.errMessage});
}
class LoadingSingleProductState extends CartState{}
class SuccessSingleProductState extends CartState{}
class FailureSingleProductState extends CartState{
  final String errMessage;

  FailureSingleProductState({required this.errMessage});
}

