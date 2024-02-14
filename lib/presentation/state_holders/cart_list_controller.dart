import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:crafty_bay/presentation/state_holders/cart_item.dart';
import 'package:get/get.dart';

import '../../data/models/cart_list_model.dart';

class CartListController extends GetxController {
  bool _inProgress = false;

  String _errorMessage = '';

  CartListModel _cartListModel = CartListModel();

  CartListModel get cartListModel => _cartListModel;

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  final RxDouble _totalPrice = 0.0.obs;

  RxDouble get totalPrice => _totalPrice;

  Future<bool> getCartList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.cartList);
    if (response.isSuccess) {
      _cartListModel = CartListModel.fromJson(response.responseData);
      _totalPrice.value = _calculateTotalPrice;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  void updateQuantity(int id, int quantity) {
    _cartListModel.cartItemList
        ?.firstWhere((element) => element.id == id)
        .quantity = quantity;
    _totalPrice.value = _calculateTotalPrice;
  }

  double get _calculateTotalPrice {
    double total = 0;
    for (CartItem item in _cartListModel.cartItemList ?? []) {
      total +=
          (double.tryParse(item.product?.price ?? '0') ?? 0) * item.quantity;
    }
    return total;
  }
}
