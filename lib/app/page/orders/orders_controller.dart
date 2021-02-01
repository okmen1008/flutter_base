import 'package:flutter/cupertino.dart';
import 'package:flutter_base/app/base/controller.dart';
import 'package:flutter_base/domain/entities/error_model.dart';
import 'package:flutter_base/domain/entities/orders_model.dart';
import 'package:flutter_base/domain/interfaces/orders_interface.dart';
import 'package:get/get.dart';

class OrdersController extends Controller {
  final OrdersInterface ordersInterface;
  OrdersController({@required this.ordersInterface});

  final listOrders = List<OrdersModel>().obs;

  Future<void> fetchInfoOrders({VoidCallback callback}) async {
    status(Status.loading);

    ordersInterface.getOrders().then(
            (value) {
              listOrders.clear();
              listOrders.addAll(value);
              status(Status.success);

              callback?.call();
            },
      onError: (err) {
        if(err is ErrorModel){
          // TODO: callbackError
        }
        status(Status.error);
      }
    );
  }
}