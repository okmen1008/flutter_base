import 'package:flutter/material.dart';
import 'package:flutter_base/app/widgets/colors.dart';
import 'package:flutter_base/app/widgets/common_widget.dart';
import 'package:flutter_base/app/widgets/text_style.dart';
import 'package:flutter_base/domain/entities/ranktop_model.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_base/app/base/state_view.dart';
import 'package:flutter_base/app/page/ranktop/ranktop_controller.dart';

class RankTopView extends View {
  @override
  _RankTopViewState createState() => _RankTopViewState();
}

class _RankTopViewState extends ViewState<RankTopView, RankTopController> {

  @override
  void initState() {
    super.initState();
    controller.fetchListRankTop();
  }

  @override
  Widget buildPage(BuildContext context) {
    return Obx(
        () => Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: Text('Xếp hạng'),
                centerTitle: true,
                actions: [
                  IconButton(
                    icon: Icon(Icons.sort_by_alpha, color: Colors.white),
                    onPressed: () {
                      Get.bottomSheet(
                        Container(
                          height: 120,
                          color: Colors.white,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.ac_unit),
                                title: Text('A - Z'),
                                onTap: () {
                                  controller.sortByAZ();
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.ac_unit),
                                title: Text('Z - A'),
                                onTap: () {
                                  controller.sortByZA();
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              body: ListView.builder(
                itemCount: controller.listRankTop.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(
                      '${controller.listRankTop[index].ranking}',
                      style: Style.h6TextStyle.copyWith(color: peacockBlue),
                    ),
                    title: Text(
                      controller.listRankTop[index].name
                    ),
                    subtitle: Text(controller.listRankTop[index].total.toString()),
                  );
                },
              ),
            ),
            loading(status: controller.status.value, context: context),
          ],
        ),
    );
  }
}

