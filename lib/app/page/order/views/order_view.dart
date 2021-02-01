import 'package:flutter/material.dart';
import 'package:flutter_base/app/base/state_view.dart';
import 'package:flutter_base/app/page/order/order_controller.dart';
import 'package:flutter_base/app/routes/app_pages.dart';
import 'package:flutter_base/app/widgets/colors.dart';
import 'package:flutter_base/app/widgets/common_widget.dart';
import 'package:get/get.dart';

class OrderView extends View {
  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends ViewState<OrderView, OrderController> {
  TextEditingController _controllerNick;
  TextEditingController _controllerSetting;

  @override
  void initState() {
    super.initState();
    _controllerNick = new TextEditingController();
    _controllerSetting = new TextEditingController();
    controller.fetchProfileCustomer();
    controller.getSetting();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllerNick.dispose();
    _controllerSetting.dispose();
  }

  @override
  Widget buildPage(BuildContext context) {
    //print(controller.profileCustomer.value.name.toString());
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text('Đặt hàng'),
              centerTitle: true,
            ),
            body: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Card(
                  child: ListTile(
                    title: Text(
                      'Nick mua hàng',
                      style: TextStyle(color: ceruleanTwo),
                    ),
                    trailing: Icon(
                      Icons.playlist_add,
                      color: ceruleanTwo,
                    ),
                    onTap: () {
                      showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Obx(() => Column(
                              mainAxisSize: MainAxisSize.min,
                              children: controller.profileCustomer.value.nicknames
                                  .map((text) => RadioListTile(
                                groupValue: controller.radioGroupValue.value,
                                title: Text("$text"),
                                value: text,
                                onChanged: (val) {
                                  controller.setRadioGroupValue(val);
                                  _controllerNick.text = "$val";
                                  controller.isVisibleTextfieldNick(true);
                                },
                              )).toList(),
                            ));
                          });
                    },
                  ),
                ),
                Visibility(
                  visible: controller.isVisibleTextfieldNick.value,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff7C4DFF),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: _controllerNick,
                      ),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Phương thức thanh toán',
                      style: TextStyle(color: ceruleanTwo),
                    ),
                    trailing: Icon(
                      Icons.playlist_add,
                      color: ceruleanTwo,
                    ),
                    onTap: () {
                      showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Obx(() => SingleChildScrollView(
                              child: Column(
                                children: controller.listSetting
                                    .map((text) => RadioListTile(
                                  groupValue: controller.radioGroupValue.value,
                                  title: Text("$text"),
                                  value: text,
                                  onChanged: (val) {
                                    controller.setRadioGroupValue(val);
                                    _controllerSetting.text = "$val";
                                    controller.isVisibleTextfieldSetting(true);
                                  },
                                )).toList(),
                              ),
                            ));
                          });
                    },
                  ),
                ),
                Visibility(
                  visible: controller.isVisibleTextfieldSetting.value,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff7C4DFF),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        controller: _controllerSetting,
                      ),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Sản phẩm đã chọn (${controller.listSelected.length.toString()})',
                      style: TextStyle(color: ceruleanTwo),
                    ),
                    trailing: Icon(
                      Icons.playlist_add,
                      color: ceruleanTwo,
                    ),
                    onTap: () {
                      Get.toNamed(Routes.PRODUCT).then(
                              (value) => controller.listSelected.addAll(value));
                    },
                  ),
                ),
                controller.listSelected.length != 0
                    ? Container(
                  height: 150,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: controller.listSelected.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                            side: BorderSide(
                                width: 1, color: Color(0xff7C4DFF))),
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  controller.listSelected[index].name,
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xff7C4DFF)),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                controller.listSelected[index].price.toString() + "đ",
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff7C4DFF)),
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            color: Colors.blue,
                            iconSize: 25,
                            onPressed: () {
                              controller.listSelected.remove(controller.listSelected[index]);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                )
                    : Container(),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Ghi chú',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            bottomSheet: Container(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Tổng tiền: ',
                            style: TextStyle(
                                color: Color(0xff7C4DFF), fontSize: 22),
                          ),
                          Text(
                            '${controller.getPrice(controller.listSelected)}đ',
                            style: TextStyle(
                                color: Color(0xff7C4DFF), fontSize: 22),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Center(child: Text("Đặt hàng thành công")),
                            content: RaisedButton(
                              child: Text('Đóng', style: TextStyle(color: Colors.white),),
                              color: Colors.blue,
                              onPressed: () {
                                Get.offAllNamed(Routes.HOME);
                              },
                            ),
                          ));
                    },
                    child: Container(
                      height: 60,
                      color: Color(0xff7C4DFF),
                      child: Center(
                          child: Text(
                            'Xác nhận',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
          loading(status: controller.status.value, context: context),
        ],
      ),
    );
  }
}
