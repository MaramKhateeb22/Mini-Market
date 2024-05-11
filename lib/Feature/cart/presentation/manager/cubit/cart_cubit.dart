import 'package:bloc/bloc.dart';
import '/Feature/cart/data/models/get_single_product.dart';
import '/Feature/cart/presentation/manager/cubit/cart_state.dart';

import '../../../data/models/all_carts_model.dart';
import '../../../data/models/cart_user_model.dart';
import '../../../data/repos/cart_repo.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepository) : super(InitialCartState()) {}
  CartUserModel? userCart;
  List<AllCartsModel>? allCart;
  final CartRepository cartRepository;
  GetSingleProduct? oneproduct;

  getUserCart() async {
    emit(LoadingCartState());
    final response = await cartRepository.getUserCart();
    response.fold(
        (errMessage) => emit(FailureCartState(errMessage: errMessage)), (cart) {
      userCart = cart;
      emit(SuccessCartState());
    });
  }

  getAllCart() async {
    emit(LoadingAllCartsState());
    final response = await cartRepository.getAllCart();
    response.fold(
        (errMessage) => emit(FailureAllCartsState(errMessage: errMessage)),
        (carts) {
      allCart = carts;
      emit(SuccessAllCartsState());
    });
  }

  getSingleProduct({required int  id}) async {

    emit(LoadingSingleProductState());
    final response = await cartRepository.getSingleProduct(id: id);
    response.fold(
        (errMessage) => emit(FailureSingleProductState(errMessage: errMessage)),
        (product) {
          oneproduct=product;
          emit(SuccessSingleProductState());});
  }
 Future<List<GetSingleProduct>> getAllProductsCart(AllCartsModel item) async{
   List<GetSingleProduct> products = [];
   for (var product in item.products!) {
       await getSingleProduct(id: product.productId!);

     // ثم أضف المنتج الذي تم الحصول عليه إلى القائمة
     products.add(oneproduct!);

     // الطباعة داخل الحلقة لن تحدث حتى تكتمل عملية getSingleProduct
     print(oneproduct!.price);
   }
    // item.products!.forEach((product) async {
    //  await getSingleProduct(id: product.productId!);
    //   // await BlocProvider.of<CartCubit>(context)
    //   //     .getSingleProduct(id: product.productId!);
    //   products.add(oneproduct!
    //     // BlocProvider.of<CartCubit>(context).oneproduct!
    //   );
    //   print(products[0].price);
    // });
    return products ;
  }
}
