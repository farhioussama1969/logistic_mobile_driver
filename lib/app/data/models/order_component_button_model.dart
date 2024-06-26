class OrderComponentButtonModel {
  int? id;
  int? statusId;
  String? text;
  String? icon;
  String? color;
  String? bgcolor;
  String? isCallAction;
  String? action;
  bool? isLoading = false;

  OrderComponentButtonModel(
      {this.id, this.statusId, this.text, this.icon, this.color, this.bgcolor, this.isCallAction, this.action, this.isLoading});

  OrderComponentButtonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statusId = json['status_id'];
    text = json['text'];
    icon = json['icon'];
    color = json['color'];
    bgcolor = json['bgcolor'];
    isCallAction = json['isCallAction'];
    action = json['action'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status_id'] = this.statusId;
    data['text'] = this.text;
    data['icon'] = this.icon;
    data['color'] = this.color;
    data['bgcolor'] = this.bgcolor;
    data['isCallAction'] = this.isCallAction;
    data['action'] = this.action;
    return data;
  }
}
