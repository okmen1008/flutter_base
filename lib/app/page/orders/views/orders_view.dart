import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/app/widgets/common_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_base/app/base/state_view.dart';
import 'package:flutter_base/app/page/orders/orders_controller.dart';

class OrdersView extends View {
  @override
  _OrdersViewState createState() => _OrdersViewState();
}

class _OrdersViewState extends ViewState<OrdersView, OrdersController> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.fetchInfoOrders();
  }

  @override
  Widget buildPage(BuildContext context) {
    return Obx(
        () => Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: Text('Đơn hàng'),
                centerTitle: true,
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              body: Container(),
            ),
            loading(status: controller.status.value, context: context),
          ],
        ),
    );
  }

}

