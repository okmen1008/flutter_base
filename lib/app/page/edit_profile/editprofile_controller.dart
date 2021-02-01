
import 'package:flutter_base/app/base/controller.dart';
import 'package:flutter_base/domain/entities/profile_model.dart';
import 'package:flutter_base/domain/interfaces/editprofile_interface.dart';
import 'package:get/get.dart';

class EditProfileController extends Controller {
  final EditProfileInterface editProfileInterface;
  EditProfileController({this.editProfileInterface});

  final profileModel = ProfileModel().obs;

  final bankName = Rx<String>();
  final branchName = Rx<String>();
  final bankOwnerAccount = Rx<String>();
  final bankAccount = Rx<String>();
  final phone = Rx<String>();
  final facebookNickname = Rx<String>();
  final nickname = Rx<String>();

  getProfile(ProfileModel data) {
    profileModel(data);
    nickname(getNickName());
  }

  String getNickName() {
    return profileModel.value.nicknames.toString().substring(1, profileModel.value.nicknames.toString().length - 1);
  }

  updateProfile() async {
    print(bankName.value);
    await editProfileInterface.updateProfile(
        bankName: bankName.value ?? profileModel.value.bankName,
        branchName: branchName.value ?? profileModel.value.branchName,
        bankOwnerAccount: bankOwnerAccount.value ?? profileModel.value.bankOwnerAccount,
        bankAccount: bankAccount.value ?? profileModel.value.bankAccount,
        phone: phone.value ?? profileModel.value.phone,
        facebookNickname: facebookNickname.value ?? profileModel.value.facebookNickname,
        nicknames: nickname.value ?? getNickName(),
    );
  }

}