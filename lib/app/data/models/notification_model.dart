class NotificationModel {
  int? id;
  String? title;
  String? message;
  String? data;
  String? typeof;
  String? createdAt;
  String? icon;

  NotificationModel({this.id, this.title, this.message, this.data, this.typeof, this.createdAt, this.icon});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    message = json['message'];
    data = json['data'];
    typeof = json['typeof'];
    createdAt = json['created_at'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['message'] = this.message;
    data['data'] = this.data;
    data['typeof'] = this.typeof;
    data['created_at'] = this.createdAt;
    data['icon'] = this.icon;
    return data;
  }
}
