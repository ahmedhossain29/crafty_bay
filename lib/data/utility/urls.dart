class Urls {
  static const String _baseUrl = 'http://ecom-api.teamrabbil.com/api';

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
      '$_baseUrl/ProductDetailsById/$productId';

  static String addToCart = '$_baseUrl/CreateCartList';
  static String cartList = '$_baseUrl/CartList';
  static String createInvoice = '$_baseUrl/InvoiceCreate';
  static String createWishList = '$_baseUrl/CreateWishList';
  static String wishList = '$_baseUrl/ProductWishList';
  static String deleteCartList(int productId) =>
      '$_baseUrl/DeleteCartList/$productId';
  static String reviewList(int productId) =>
      '$_baseUrl/ListReviewByProduct/$productId';
  static String createReview = '$_baseUrl/CreateProductReview';
}
