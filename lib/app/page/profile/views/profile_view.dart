import 'package:flutter/material.dart';
import 'package:flutter_base/app/base/state_view.dart';
import 'package:flutter_base/app/page/profile/profile_controller.dart';
import 'package:flutter_base/app/routes/app_pages.dart';
import 'package:flutter_base/app/widgets/colors.dart';
import 'package:flutter_base/app/widgets/common_widget.dart';
import 'package:flutter_base/app/widgets/text_style.dart';
import 'package:get/get.dart';

class ProfileView extends View {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends ViewState<ProfileView, ProfileController> {
  List<Widget> toListWidget(List list) {
    if (list == null) {
      return [];
    } else {
      return (list.map((item) => nickNameItem(item)).toList());
    }
  }

  Widget nickNameItem(String item) {
    return Text(
      item, style: Style.customProfileTextStyle,
    );
  }

  @override
  void initState() {
    super.initState();
    controller.fetchInformation();
  }

  @override
  Widget buildPage(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text(
                'Cá nhân'
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(Icons.edit_outlined, color: Colors.white,),
                  onPressed: () {
                    Get.toNamed(Routes.EDITPROFILE,
                      arguments: controller.information.value,
                      preventDuplicates: false
                    );
                  },
                ),
              ],
            ),
            body: controller.information.value.name == null
              ? Center() : showInformation(context: context,
                profileModel: controller.information.value,
                endBankAccount: controller.endBankAccount.value)
          ),
          loading(status: controller.status.value, context: context),
        ],
      ),
    );
  }
}

