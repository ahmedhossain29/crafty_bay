import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

import 'cart_list_model.dart';

class CartListController extends GetxController {
  bool _inProgress = false;

  String _errorMessage = '';

  CartListModel _cartListModel = CartListModel();

  CartListModel get cartListModel => _cartListModel;

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  Future<bool> getCartList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().postRequest(Urls.cartList);
    if (response.isSuccess) {
      _cartListModel = CartListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
