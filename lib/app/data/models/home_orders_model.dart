import 'package:loogisti/app/data/models/order_model.dart';
import 'package:loogisti/app/data/models/pagination_model.dart';

class HomeOrdersModel {
  int? count;
  PaginationModel<OrderModel>? orders;

  HomeOrdersModel({this.count, this.orders});

  HomeOrdersModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    orders = json['orders'] != null ? PaginationModel<OrderModel>.fromJson(json['orders'], OrderModel.fromJson) : null;
  }
}
