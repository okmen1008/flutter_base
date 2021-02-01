import 'package:flutter/cupertino.dart';
import 'package:flutter_base/app/base/controller.dart';
import 'package:flutter_base/domain/entities/product_model.dart';
import 'package:flutter_base/domain/entities/profile_model.dart';
import 'package:flutter_base/domain/interfaces/order_interface.dart';
import 'package:get/get.dart';

class OrderController extends Controller {
  /// inject repo abstraction dependency
  final OrderInterface orderInterface;
  OrderController({@required this.orderInterface});

  final radioGroupValue = "".obs;
  final nickValue = "".obs;
  final isVisibleTextfieldNick = false.obs;
  final isVisibleTextfieldSetting = false.obs;

  /// create a reactive status from request with initial value = loading
  final listSelected = List<ProductModel>().obs;
  final profileCustomer = ProfileModel().obs;
  final listSetting = List<String>().obs;
  int price = 0;
  setRadioGroupValue(val) {
    radioGroupValue(val);
  }

  setTextFileValue(val) {
    nickValue(val);
  }

  int getPrice(List<ProductModel> listSelected) {
    price = 0;
    for (int i = 0; i < listSelected.length; i++) {
      price += listSelected[i].price;
    }
    return price;
  }

  Future<void> getSetting() async {
    orderInterface.getSettings().then((data) {
      for (int i = 1; i < 9; i++) {
        listSetting.add(data.paymentMethods.toJson()["$i"].toString());
      }
    }).catchError((err) {
      status(Status.error);
    });
  }

  Future<void> fetchProfileCustomer({VoidCallback callback}) async {
    status(Status.loading);
    orderInterface.getProfile().then(
          (data) {
            profileCustomer(data);

            status(Status.success);
            callback?.call();
      },
      onError: (err) {
        status(Status.error);
      },
    );
  }

  @override
  void onConnected() {
    super.onConnected();
  }
}