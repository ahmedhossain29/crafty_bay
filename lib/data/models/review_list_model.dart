import 'package:crafty_bay/data/models/review_list.dart';

class ReviewListModel {
  String? msg;
  List<ReviewList>? reviewList;

  ReviewListModel({this.msg, this.reviewList});

  ReviewListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      reviewList = <ReviewList>[];
      json['data'].forEach((v) {
        reviewList!.add(ReviewList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (reviewList != null) {
      data['data'] = reviewList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
