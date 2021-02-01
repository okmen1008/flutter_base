import 'package:dio/dio.dart';
import 'package:flutter_base/domain/entities/orders_model.dart';
import 'package:flutter_base/domain/interfaces/orders_interface.dart';

import '../api_constant.dart';

class OrdersRepository implements OrdersInterface {
  final Dio dio;
  OrdersRepository({this.dio});

  @override
  Future<List<OrdersModel>> getOrders() async {
    try {
      final response = await dio.get(ApiConstant.ORDERS,
          options: await HeaderNetWorkConstant.getOptionsWithToken());
      return (response.data as List).map((e) => OrdersModel.fromJson(e)).toList();
    } on DioError catch (e) {
      return Future.error(e.response.data);
    }
  }

}