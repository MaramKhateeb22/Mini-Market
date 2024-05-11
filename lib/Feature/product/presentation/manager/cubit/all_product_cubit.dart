import 'package:bloc/bloc.dart';
import '/Feature/product/presentation/manager/cubit/all_product_state.dart';

import '../../../data/data/model/all_product_model.dart';
import '../../../data/data/repos/all_product_repos.dart';

class AllProductubit extends Cubit<AllProductState>{
  AllProductubit(this.allProductRepository):super(InitialState()){}
  final AllProductRepository allProductRepository;

List<AllProductMdel>? allProductMdel;

  allProduct()async{
    emit(LoadingState());
   final response =await allProductRepository.allProduct();
   response.fold(
           (errMessage) => emit(FailureState()),
           (allProductModel) {
             allProductMdel=allProductModel;
               emit(SuccessState());

           } );
  }

}