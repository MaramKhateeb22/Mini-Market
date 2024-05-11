class EndPoint {
  static String baseUrl = "https://fakestoreapi.com/";
  static String signIn = "auth/login";
  static String allProducts = "products";
  static String allCarts= "carts";
  static String getUserDataEndPoint(id) {
    return "users/$id";
  }
  static String getUserCartEndPoint(id) {
    return "carts/user/$id";
  }
  static String getSingleProductEndPoint(id) {
    return "products/$id";
  }
}

class ApiKey {
  static String status = "status";
  static String errorMessage = "ErrorMessage";
  static String email = "email";
  static String username = "username";
  static String password = "password";
  static String token = "token";
  static String message = "message";
  static String id = "id";
  static String name = "name";
  static String phone = "phone";
  static String confirmPassword = "confirmPassword";
  static String location = "location";
  static String profilePic = "profilePic";
}
