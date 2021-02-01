import 'package:dio/dio.dart';
import 'package:flutter_base/domain/interfaces/editprofile_interface.dart';

import '../api_constant.dart';

class EditProfileRepository implements EditProfileInterface {
  final Dio dio;
  EditProfileRepository({this.dio});

  @override
  Future updateProfile({
    String bankName,
    String branchName,
    String bankOwnerAccount,
    String bankAccount,
    String phone,
    String facebookNickname,
    String nicknames
  }) async {
    try {
       await dio.put(ApiConstant.EDITPROFILE,
          options: await HeaderNetWorkConstant.getOptionsWithToken(),
          queryParameters: ({
              'bank_name' : bankName,
              'branch_name' : branchName,
              'bank_owner_account' : bankOwnerAccount,
              'bank_account' : bankAccount,
              'phone' : phone,
              'facebook_nickname' : facebookNickname,
              'nicknames' : nicknames,
          })
      );
    } on DioError catch (e) {
      return Future.error(e.response.data);
    }
  }

}