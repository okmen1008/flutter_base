
import 'package:flutter_base/app/binding/edit_profile/editprofile_binding.dart';
import 'package:flutter_base/app/binding/home/home_binding.dart';
import 'package:flutter_base/app/binding/login/login_binding.dart';
import 'package:flutter_base/app/binding/order/order_binding.dart';
import 'package:flutter_base/app/binding/product/product_binding.dart';
import 'package:flutter_base/app/binding/profile/profile_binding.dart';
import 'package:flutter_base/app/page/edit_profile/views/editprofile_view.dart';
import 'package:flutter_base/app/page/home/views/home_view.dart';
import 'package:flutter_base/app/page/home/views/shop_view.dart';
import 'package:flutter_base/app/page/login/view/login.dart';
import 'package:flutter_base/app/page/order/views/order_view.dart';
import 'package:flutter_base/app/page/orders/views/orders_view.dart';
import 'package:flutter_base/app/page/product/views/product_view.dart';
import 'package:flutter_base/app/page/profile/views/profile_view.dart';
import 'package:flutter_base/app/page/ranktop/views/ranktop_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.SHOP,
      page: () => ShopView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => Login(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.PRODUCT,
      page: () => ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: Routes.ORDER,
      page: () => OrderView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfileView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.RANKTOP,
      page: () => RankTopView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.ORDERS,
      page: () => OrdersView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.EDITPROFILE,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),

  ];
}
