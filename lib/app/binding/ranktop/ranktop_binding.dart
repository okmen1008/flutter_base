import 'package:flutter_base/app/page/ranktop/ranktop_controller.dart';
import 'package:flutter_base/data/network/repositories/ranktop_repository.dart';
import 'package:flutter_base/domain/interfaces/ranktop_interface.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

class RankTopBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RankTopInterface>(() => RankTopRepository(dio: Get.find()));
    Get.lazyPut(() => RankTopController(rankTopInterface: Get.find()));
  }

}