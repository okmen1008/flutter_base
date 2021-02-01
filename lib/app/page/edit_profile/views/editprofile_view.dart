import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/app/base/state_view.dart';
import 'package:flutter_base/app/page/edit_profile/editprofile_controller.dart';
import 'package:flutter_base/app/widgets/common_widget.dart';
import 'package:get/get.dart';

class EditProfileView extends View {
  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState
    extends ViewState<EditProfileView, EditProfileController> {
  @override
  void initState() {
    super.initState();
    controller.getProfile(Get.arguments);
  }

  @override
  Widget buildPage(BuildContext context) {
    return Obx(
        () => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text('Chỉnh sửa thông tin'),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      textFormField(
                          initialValue: controller.profileModel.value.bankName,
                          labelText: 'Tên ngân hàng',
                          change: (data) {
                            controller.bankName(data);
                          }),
                      textFormField(
                          initialValue: controller.profileModel.value.branchName,
                          labelText: 'Chi nhánh ngân hàng',
                          change: (data) {
                            controller.branchName(data);
                          }),
                      textFormField(
                          initialValue: controller.profileModel.value.bankOwnerAccount,
                          labelText: 'Tên chủ tài khoản',
                          change: (data) {
                            controller.bankOwnerAccount(data);
                          }),
                      textFormField(
                          initialValue: controller.profileModel.value.bankAccount,
                          labelText: 'Tài khoản',
                          change: (data) {
                            controller.bankAccount(data);
                          }),
                      textFormField(
                          initialValue: controller.profileModel.value.phone,
                          labelText: 'Số điện thoại',
                          change: (data) {
                            controller.phone(data);
                          }),
                      textFormField(
                          initialValue: controller.profileModel.value.facebookNickname,
                          labelText: 'Facebook Link',
                          change: (data) {
                            controller.facebookNickname(data);
                          }),
                      textFormField(
                          initialValue: controller.nickname.value,
                          labelText: 'Danh sách nick mua hàng',
                          change: (data) {
                            controller.nickname(data);
                          }),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    child: RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        'Cập nhật',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () async {
                        controller.updateProfile();
                        Get.back(result: true);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          //loading(status: controller.status.value, context: context),
        ],
      ),
    );
  }
}



