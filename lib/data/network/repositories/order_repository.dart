import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_base/domain/entities/profile_model.dart';
import 'package:flutter_base/domain/entities/settings_model.dart';
import 'package:flutter_base/domain/interfaces/order_interface.dart';

import '../api_constant.dart';

class OrderRepository implements OrderInterface {
  final Dio dio;
  OrderRepository({this.dio});

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final response = await dio.get(ApiConstant.PROFILE,
          options: await HeaderNetWorkConstant.getOptionsWithToken());
      return ProfileModel.fromJson(response.data);
    } on DioError catch (e) {
      return Future.error(e.response.data);
    }
  }

  @override
  Future<Setting> getSettings() async {
    try {
      final response = await dio.get(ApiConstant.SETTINGS,
          options: await HeaderNetWorkConstant.getOptionsWithToken());
      return (Setting.fromJson(response.data));
    } on DioError catch (e) {
      return Future.error(e);
    }
  }

}