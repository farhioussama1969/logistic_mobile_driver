import 'package:loogisti/app/data/models/order_component_model.dart';
import 'package:loogisti/app/data/models/order_status_model.dart';

class OrderModel {
  int? id;
  int? userId;
  int? driverId;
  double? price;
  double? deleveryCost;
  double? percentage;
  double? pickupLocationLong;
  double? pickupLocationLate;
  double? deliveryLocationLong;
  double? deliveryLocationLate;
  String? createdAt;
  double? deleveryNewCost;
  double? totaleCost;
  String? driverPhone;
  String? deliveryName;
  String? puckUpName;
  double? distance;
  double? currentDistance;
  int? acceptButton;
  int? rejectButton;
  List<OrderStatusModel>? status;
  OrderComponentModel? orderComponent;
  bool acceptingLoading = false;
  bool rejectingLoading = false;
  String? pcolor;
  String? senderPhone;
  String? reciverPhone;
  String? action;
  double? profitCost;
  int? routeType;
  String? bestTimeDelevery;

  OrderModel({
    this.id,
    this.userId,
    this.driverId,
    this.price,
    this.deleveryCost,
    this.percentage,
    this.pickupLocationLong,
    this.pickupLocationLate,
    this.deliveryLocationLong,
    this.deliveryLocationLate,
    this.createdAt,
    this.deleveryNewCost,
    this.totaleCost,
    this.driverPhone,
    this.status,
    this.deliveryName,
    this.puckUpName,
    this.distance,
    this.currentDistance,
    this.orderComponent,
    this.acceptButton,
    this.rejectButton,
    this.pcolor,
    this.senderPhone,
    this.reciverPhone,
    this.action,
    this.profitCost,
    this.routeType,
    this.bestTimeDelevery,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    driverId = json['driver_id'];
    price = json['price'] != null ? double.parse(json['price'].toString()) : null;
    deleveryCost = json['delevery_cost'] != null ? double.parse(json['delevery_cost'].toString()) : null;
    percentage = json['percentage'] != null ? double.parse(json['percentage'].toString()) : null;
    pickupLocationLong = json['pickup_location_long'] != null ? double.parse(json['pickup_location_long'].toString()) : null;
    pickupLocationLate = json['pickup_location_late'] != null ? double.parse(json['pickup_location_late'].toString()) : null;
    deliveryLocationLong = json['delivery_location_long'] != null ? double.parse(json['delivery_location_long'].toString()) : null;
    deliveryLocationLate = json['delivery_location_late'] != null ? double.parse(json['delivery_location_late'].toString()) : null;
    createdAt = json['created_at'];
    deleveryNewCost = json['delevery_new_cost'] != null ? double.parse(json['delevery_new_cost'].toString()) : null;
    totaleCost = json['totale_cost'] != null ? double.parse(json['totale_cost'].toString()) : null;
    driverPhone = json['driver_phone'];
    deliveryName = json['delivery_name'];
    puckUpName = json['pickup_name'];
    acceptButton = json['acceptButton'];
    rejectButton = json['rejectButton'];
    if (json['status'] != null) {
      status = <OrderStatusModel>[];
      json['status'].forEach((v) {
        status!.add(new OrderStatusModel.fromJson(v));
      });
    }
    if (json['component'] != null) {
      orderComponent = OrderComponentModel.fromJson(json['component']);
    }
    pcolor = json['pcolor'];
    senderPhone = json['sender_phone'];
    reciverPhone = json['reciver_phone'];
    action = json['action'];
    routeType = json['route_type'];
    profitCost = json['profit_cost'] != null ? double.parse(json['profit_cost'].toString()) : null;
    currentDistance = json['current_distance'] != null ? double.parse(json['current_distance'].toString()) : null;
    distance = json['distance'] != null ? double.parse(json['distance'].toString()) : null;
    bestTimeDelevery = json['best_time_delevery'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['driver_id'] = this.driverId;
    data['price'] = this.price;
    data['delevery_cost'] = this.deleveryCost;
    data['percentage'] = this.percentage;
    data['pickup_location_long'] = this.pickupLocationLong;
    data['pickup_location_late'] = this.pickupLocationLate;
    data['delivery_location_long'] = this.deliveryLocationLong;
    data['delivery_location_late'] = this.deliveryLocationLate;
    data['created_at'] = this.createdAt;
    data['delevery_new_cost'] = this.deleveryNewCost;
    data['totale_cost'] = this.totaleCost;
    data['driver_phone'] = this.driverPhone;
    data['delivery_name'] = this.deliveryName;
    data['pickup_name'] = this.puckUpName;
    if (this.status != null) {
      data['status'] = this.status!.map((v) => v.toJson()).toList();
    }
    if (this.orderComponent != null) {
      data['component'] = this.orderComponent!.toJson();
    }
    data['pcolor'] = this.pcolor;
    return data;
  }
}
