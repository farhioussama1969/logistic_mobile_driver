class ActionStatusModel {
  String? orderId;
  String? statusId;
  String? updatedAt;
  String? createdAt;
  int? id;

  ActionStatusModel({this.orderId, this.statusId, this.updatedAt, this.createdAt, this.id});

  ActionStatusModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    statusId = json['status_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['status_id'] = this.statusId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
