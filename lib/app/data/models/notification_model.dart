class NotificationModel {
  int? id;
  String? title;
  String? message;
  String? data;
  String? typeof;
  String? createdAt;

  NotificationModel({this.id, this.title, this.message, this.data, this.typeof, this.createdAt});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    message = json['message'];
    data = json['data'];
    typeof = json['typeof'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['message'] = this.message;
    data['data'] = this.data;
    data['typeof'] = this.typeof;
    data['created_at'] = this.createdAt;
    return data;
  }
}
