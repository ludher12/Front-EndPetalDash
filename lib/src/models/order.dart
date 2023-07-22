import 'dart:convert';

import 'package:petaldash/src/models/address.dart';
import 'package:petaldash/src/models/product.dart';
import 'package:petaldash/src/models/user.dart';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {

  String? id;
  String? idClient;
  String? idDelivery;
  String? idAddress;
  String? status;
  double? lat;
  double? lng;
  int? timestamp;
  List<Product>? products = [];
  User? client;
  User? delivery;
  Address? address;

  Order({
    this.id,
    this.idClient,
    this.idDelivery,
    this.idAddress,
    this.status,
    this.lat,
    this.lng,
    this.timestamp,
    this.products
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    idClient: json["id_client"],
    idDelivery: json["id_delivery"],
    idAddress: json["id_address"],
    status: json["status"],
    products: json["products"],
    lat: json["lat"].toDouble(),
    lng: json["lng"].toDouble(),
    timestamp: json["timestamp"],
  );

 /* static List<Order> fromJsonList(List<dynamic> jsonList) {
    List<Order> toList = [];

    jsonList.forEach((item) {
      Order order = Order.fromJson(item);
      toList.add(order);
    });

    return toList;
  }

  */

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_client": idClient,
    "id_delivery": idDelivery,
    "id_address": idAddress,
    "status": status,
    "lat": lat,
    "lng": lng,
    "timestamp": timestamp,
    "products": products,
    /*
    "client": client,
    "delivery": delivery,
    "address": address,*/
  };
}
