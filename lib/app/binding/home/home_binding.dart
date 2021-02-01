import 'package:flutter_base/app/page/home/home_controller.dart';
import 'package:flutter_base/app/page/orders/orders_controller.dart';
import 'package:flutter_base/app/page/profile/profile_controller.dart';
import 'package:flutter_base/app/page/ranktop/ranktop_controller.dart';
import 'package:flutter_base/data/network/repositories/orders_repository.dart';
import 'package:flutter_base/data/network/repositories/profile_repository.dart';
import 'package:flutter_base/data/network/repositories/ranktop_repository.dart';
import 'package:flutter_base/data/network/repositories/shop_repository.dart';
import 'package:flutter_base/domain/interfaces/orders_interface.dart';
import 'package:flutter_base/domain/interfaces/profile_interface.dart';
import 'package:flutter_base/domain/interfaces/ranktop_interface.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopRepository>(() => ShopRepository(dio: Get.find()));
    Get.lazyPut(() => HomeController(shopRepository: Get.find()));

    Get.lazyPut<ProfileInterface>(() => ProfileRepository(dio: Get.find()));
    Get.lazyPut(() => ProfileController(profileInterface: Get.find()));

    Get.lazyPut<RankTopInterface>(() => RankTopRepository(dio: Get.find()));
    Get.lazyPut(() => RankTopController(rankTopInterface: Get.find()));

    Get.lazyPut<OrdersInterface>(() => OrdersRepository(dio: Get.find()));
    Get.lazyPut(() => OrdersController(ordersInterface: Get.find()));
  }
}
