import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../Feature/product/data/data/model/all_product_model.dart';

CacheHelper cacheHelper = CacheHelper();

class CacheHelper {
  late SharedPreferences _instance;
  Future initInstance() async {
    _instance = await SharedPreferences.getInstance();
  }


  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await _instance.setBool(key, value);
    }

    if (value is String) {
      return await _instance.setString(key, value);
    }

    if (value is int) {
      return await _instance.setInt(key, value);
    } else {
      return await _instance.setDouble(key, value);
    }
  }



  dynamic getData({required String key}) {
    return _instance.get(key);
  }



  Future<bool> setUser(User user) async {
    //user => map => string
    return await _instance.setString("user", jsonEncode(user.toMap()));
  }

  User? getUser() {
    // string => map => user
    if (_instance.getString("user") == null) return null;
    Map<String, dynamic> decoded = jsonDecode(_instance.getString("user")!);
    return User.fromMap(decoded);
  }

  Future<bool> clearUser() async {
    return await _instance.remove("user");
  }

  void saveCart(List<AllProductMdel> cartItems) async {



    List<String> cartItemsJson = cartItems.map((item) => json.encode(item.toJson())).toList();


    await _instance.setStringList('cartItems', cartItemsJson);
  }


  Future<List<AllProductMdel>> loadCart() async {

    final List<String>? cartItemsJson = _instance.getStringList('cartItems');

    if (cartItemsJson == null) return [];

    return cartItemsJson.map((itemJson) => AllProductMdel.fromJson(json.decode(itemJson))).toList();
  }


  Future<bool> clearCart() async {
    return await _instance.remove("cartItems");
  }



}

class User {
  final String name;
  // final String email;

//<editor-fold desc="Data Methods">
  const User({
    required this.name,
    // required this.email,
  });

  User copyWith({
    String? name,
    String? email,
  }) {
    return User(
      name: name ?? this.name,
      // email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      // 'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      // email: map['email'] as String,
    );
  }
}
class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({required this.id, required this.title, required this.quantity, required this.price});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'quantity': quantity,
      'price': price,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> map) {
    return CartItem(

      id: map['id'] as String,
      title:map['title'] as String,
      quantity : map['quantity'] as int,
      price: map['price'] as double,
      // email: map['email'] as String,
    );
  }
}
