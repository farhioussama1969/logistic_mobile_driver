class CommentModel {
  int? userId;
  String? orderId;
  String? type;
  String? content;
  String? updatedAt;
  String? createdAt;
  int? id;

  CommentModel({this.userId, this.orderId, this.type, this.content, this.updatedAt, this.createdAt, this.id});

  CommentModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    orderId = json['order_id'];
    type = json['type'].toString();
    content = json['content'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['order_id'] = this.orderId;
    data['type'] = this.type;
    data['content'] = this.content;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
