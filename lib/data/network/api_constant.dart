
import 'package:dio/dio.dart';
import 'package:flutter_base/data/storage/hive_storage.dart';

class ApiConstant{
  static const  BASE_URL = 'https://demo.shopmede.com/api/';

  //API
  static const SHOPS = 'shops';
  static const PRODUCT = 'products/foruser';
  static const CATEGORIES = 'categories/product';
  static const PROFILE = 'profile';
  static const SETTINGS = 'settings';
  static const RANKTOP = 'rank/top';
  static const ORDERS = 'orders/me';
  static const EDITPROFILE = 'profile/save';

}

class HttpMethodConstant{
  static const  POST = 'POST';
  static const  GET = 'GET';
  static const  PUT = 'PUT';
  static const  HEAD = 'HEAD';
  static const  DELETE = 'DELETE';
  static const  PATCH = 'PATCH';
}

class HeaderNetWorkConstant {
  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: ApiConstant.BASE_URL,
      connectTimeout: 10000,
      receiveTimeout: 10000,
      headers: {
        // 'Content-Type': 'application/json',
        // 'Content-Type': 'application/x-www-form-urlencoded',
        // 'charset': 'utf-8',
        'accept': 'application/json'
      });

  static Future<Options> getOptionsWithToken({
    final String accept = 'application/json',
    final int sendTimeout = 60000,
    final int receiveTimeout = 60000,
  }) async {
    final token = await HiveStorage.getToken();

    return Options(
        sendTimeout: sendTimeout,
        receiveTimeout: receiveTimeout,
        headers: {
          'accept': accept,
          // 'Content-Type': 'application/x-www-form-urlencoded',
          'Access-Token': token,
        });
  }
}
