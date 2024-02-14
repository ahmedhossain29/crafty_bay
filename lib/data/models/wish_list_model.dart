import 'package:crafty_bay/presentation/state_holders/wish_list_item.dart';

class WishListModel {
  String? msg;
  List<WishListItem>? wishItemList;

  WishListModel({this.msg, this.wishItemList});

  WishListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      wishItemList = <WishListItem>[];
      json['data'].forEach((v) {
        wishItemList!.add(WishListItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (wishItemList != null) {
      data['data'] = wishItemList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
