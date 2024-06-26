import 'dart:ui';

import 'package:loogisti/app/core/utils/color_convertor_util.dart';

class OrderStatusModel {
  int? id;
  String? name;
  String? title;
  String? createdAt;
  String? icon;
  Color? backgroundColor;
  Color? color;

  OrderStatusModel({this.id, this.name, this.title, this.createdAt, this.icon, this.backgroundColor, this.color});

  OrderStatusModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    createdAt = json['created_at'];
    icon = json['icon'];
    backgroundColor = ColorConvertorUtil().stringColorCodeToColor(json['bgcolor']);
    color = ColorConvertorUtil().stringColorCodeToColor(json['color']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['title'] = this.title;
    data['created_at'] = this.createdAt;
    data['icon'] = this.icon;

    return data;
  }
}
