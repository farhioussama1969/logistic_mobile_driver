import 'package:loogisti/app/data/models/order_model.dart';
import 'package:loogisti/app/data/models/pagination_model.dart';

class HomeOrdersModel {
  int? progress;
  int? rejected;
  int? completed;

  PaginationModel<OrderModel>? orders;

  HomeOrdersModel({this.orders, this.progress, this.completed, this.rejected});

  HomeOrdersModel.fromJson(Map<String, dynamic> json) {
    progress = json['progress'];
    completed = json['completed'];
    rejected = json['rejected'];
    orders = json['orders'] != null ? PaginationModel<OrderModel>.fromJson(json['orders'], OrderModel.fromJson) : null;
  }
}
