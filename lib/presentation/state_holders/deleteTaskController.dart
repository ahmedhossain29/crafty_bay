import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:crafty_bay/presentation/state_holders/cart_item.dart';
import 'package:get/get.dart';

import '../../data/models/cart_list_model.dart';

class DeleteCartListController extends GetxController {
  bool _inProgress = false;

  String _errorMessage = '';

  CartListModel _cartListModel = CartListModel();

  CartListModel get cartListModel => _cartListModel;

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  late final CartItem cartItem;

  Future<bool> deleteCartList(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response =
        await NetworkCaller().getRequest(Urls.deleteCartList(productId));
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
