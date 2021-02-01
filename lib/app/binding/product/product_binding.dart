import 'package:flutter_base/app/page/product/product_controller.dart';
import 'package:flutter_base/data/network/repositories/product_repository.dart';
import 'package:get/get.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductRepository>(() => ProductRepository(dio: Get.find()));
    Get.lazyPut(() => ProductController(productRepository: Get.find()));
  }

}