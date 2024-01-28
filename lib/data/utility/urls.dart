class Urls {
  static const String _baseUrl = 'https://craftybay.teamrabbil.com/api';

  static String sentEmailOtp(String email) => '$_baseUrl/UserLogin/$email';
  static String verifyOTP(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';

  static String readProfile = '$_baseUrl/ReadProfile';
  static String createProfile = '$_baseUrl/CreateProfile';
  static String homeBanner = '$_baseUrl/ListProductSlider';
  static String categoryList = '$_baseUrl/CategoryList';
  static String popularProductList = '$_baseUrl/ListProductByRemark/popular';
  static String specialProductList = '$_baseUrl/ListProductByRemark/special';
  static String newProductList = '$_baseUrl/ListProductByRemark/new';
  static String productsByCategory(int categoryId) =>
      '$_baseUrl/ListProductByCategory/$categoryId';

  static String productDetails(int productId) =>
      '$_baseUrl/ListProductByCategory/$productId';
}
