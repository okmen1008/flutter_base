import 'package:dio/dio.dart';
import 'package:flutter_base/domain/entities/profile_model.dart';
import 'package:flutter_base/domain/interfaces/profile_interface.dart';

import '../api_constant.dart';

class ProfileRepository implements ProfileInterface {
  final Dio dio;
  ProfileRepository({this.dio});

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

}