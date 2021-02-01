import 'package:flutter_base/app/page/orders/orders_controller.dart';
import 'package:flutter_base/data/network/repositories/orders_repository.dart';
import 'package:flutter_base/domain/interfaces/orders_interface.dart';
import 'package:get/get.dart';

class OrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrdersInterface>(() => OrdersRepository(dio: Get.find()));
    Get.lazyPut(() => OrdersController(ordersInterface: Get.find()));
  }
}