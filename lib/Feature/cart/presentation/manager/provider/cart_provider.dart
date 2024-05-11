import 'package:flutter/foundation.dart';
import '/Feature/product/data/data/model/all_product_model.dart';
import '/core/cache_helper/cache_helper.dart';


class ProviderCart extends ChangeNotifier {



  List<AllProductMdel> items = [];


  bool isLoading = false;

  /// Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(AllProductMdel item) {
    items.add(item);
    print('5555555555555555555555' '${item.title}');
    notifyListeners();
  }
  getAllItem (){
    return items;
  }


  void clearAll() async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    items.clear();
    isLoading = false;
    notifyListeners();
  }

  void saveCart()  async{
    List<AllProductMdel> oldAndNewItems = [];
    oldAndNewItems=await  cacheHelper.loadCart();
    oldAndNewItems.addAll(items);
    cacheHelper.saveCart(oldAndNewItems);
    clearAll();

  }
void clearCart() async{

  notifyListeners();
}}
