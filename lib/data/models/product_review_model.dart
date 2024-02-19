class ProductReviewModel {
  String? msg;
  ProductReview? productReview;

  ProductReviewModel({this.msg, this.productReview});

  ProductReviewModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    productReview =
        json['data'] != null ? ProductReview.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (productReview != null) {
      data['data'] = productReview!.toJson();
    }
    return data;
  }
}

class ProductReview {
  int? id;
  String? description;
  int? rating;
  int? customerId;
  int? productId;
  String? createdAt;
  String? updatedAt;

  ProductReview(
      {this.id,
      this.description,
      this.rating,
      this.customerId,
      this.productId,
      this.createdAt,
      this.updatedAt});

  ProductReview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    rating = json['rating'];
    customerId = json['customer_id'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['rating'] = rating;
    data['customer_id'] = customerId;
    data['product_id'] = productId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
