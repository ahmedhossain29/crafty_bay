import 'package:crafty_bay/data/models/product_review_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CreateProductReviewController extends GetxController {
  bool _inProgress = false;

  String _errorMessage = '';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  ProductReviewModel _productReviewModel = ProductReviewModel();
  ProductReviewModel get productReviewModel => _productReviewModel;

  Future<bool> createReview(String description, int id, int rating,
      int customerID, int productID) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    Map<String, dynamic> inputParams = {
      "id": id,
      "description": description,
      "rating": rating,
      "customer_id": customerID,
      "product_id": productID,
    };
    final response =
        await NetworkCaller().postRequest(Urls.createReview, body: inputParams);
    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
