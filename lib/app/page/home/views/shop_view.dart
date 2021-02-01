import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/app/base/state_view.dart';
import 'package:flutter_base/app/page/home/home_controller.dart';
import 'package:flutter_base/app/routes/app_pages.dart';
import 'package:flutter_base/app/widgets/colors.dart';
import 'package:flutter_base/app/widgets/common_widget.dart';
import 'package:get/get.dart';

class ShopView extends View {
  @override
  _ShopViewState createState() => _ShopViewState();
}

class _ShopViewState extends ViewState<ShopView, HomeController> {
  @override
  void initState() {
    super.initState();
    controller.fetchListShop();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget buildPage(context) {
    return Obx(() => Stack(
      children: [
        Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('List shop'),
            ),
            body: ListView.builder(
                itemCount: controller.listShop.length,
                itemBuilder: (context, index) {
                  //return Text(controller.listShop[index].name);
                  return Card(
                    child: ListTile(
                      title: Text(
                        '${controller.listShop[index].name}',
                        style: TextStyle(color: peacockBlue),
                      ),
                      onTap: () {
                        Get.toNamed(Routes.ORDER);
                      },
                    ),
                  );
                })),
        // loading(
        //     status: controller.status.value,
        //     context: context)
      ],
    ));
  }
}
