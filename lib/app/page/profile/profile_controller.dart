import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_base/app/base/controller.dart';
import 'package:flutter_base/domain/entities/profile_model.dart';
import 'package:flutter_base/domain/interfaces/profile_interface.dart';
import 'package:get/get.dart';

class ProfileController extends Controller {
  ProfileController({@required this.profileInterface});
  final ProfileInterface profileInterface;

  final information = ProfileModel().obs;
  final endBankAccount = Rx<String>();

  Future<void> fetchInformation({VoidCallback callback}) async {
    status(Status.loading);
    profileInterface.getProfile().then(
          (value) {
        information(value);
        //print(information.value.nicknames.toString().characters.getRange(1, information.value.nicknames.toString().length - 1));
        final getEndBankAccount = information.value.bankAccount.characters.getRange(
            information.value.bankAccount.length - 9,
            information.value.bankAccount.length);
        endBankAccount(getEndBankAccount.toString());
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
    // TODO: implement onConnected
    super.onConnected();
  }

}