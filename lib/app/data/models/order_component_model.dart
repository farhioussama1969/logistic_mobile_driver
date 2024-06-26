import 'package:loogisti/app/data/models/order_component_button_model.dart';

class OrderComponentModel {
  int? id;
  int? statusId;
  String? text;
  List<OrderComponentButtonModel>? buttons;

  OrderComponentModel({this.id, this.statusId, this.text, this.buttons});

  OrderComponentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statusId = json['status_id'];
    text = json['text'];
    if (json['buttons'] != null) {
      buttons = <OrderComponentButtonModel>[];
      json['buttons'].forEach((v) {
        buttons!.add(new OrderComponentButtonModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status_id'] = this.statusId;
    data['text'] = this.text;
    if (this.buttons != null) {
      data['buttons'] = this.buttons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
