import 'package:flutter_base/domain/entities/orders_model.dart';

abstract class OrdersInterface {
  Future<List<OrdersModel>> getOrders();
}