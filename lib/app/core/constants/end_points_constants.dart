class EndPointsConstants {
  static const String baseUrl = 'https://loogisti.com/api/v1/';

  //config provider
  static const String termsAndConditions = 'terms-of-use';
  static const String contact = 'contact-us';
  static const String about = 'who-are-we';

  //auth provider
  static const String socialSignIn = 'driver/login';
  static const String getUserData = 'driver/info';
  static const String updateUserData = 'driver/update';
  static const String logout = 'driver/logout';
  static const String deleteAccount = 'driver/destroy';
  static const String changeStatus = 'driver/activate';

  //order provider
  static const String createOrder = 'order/create';
  static const String getOrders = 'driver/order/all';
  static const String getDeliveryPricing = 'order/price';
  static const String couponValidate = 'coupon/validate';
  static const String commentOrder = 'comment/create';
  static String changeOrderStatus(int? orderId, int? statusId) => 'order/$orderId/action/$statusId';

  //notification provider
  static const String getNotifications = 'notification/all';
}
