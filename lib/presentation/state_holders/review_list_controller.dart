import 'package:crafty_bay/data/models/review_list_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class ReviewListController extends GetxController {
  bool _inProgress = false;

  String _errorMessage = '';

  ReviewListModel _reviewListModel = ReviewListModel();

  ReviewListModel get reviewListModel => _reviewListModel;

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  Future<bool> getReviewList(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response =
        await NetworkCaller().getRequest(Urls.reviewList(productId));
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
