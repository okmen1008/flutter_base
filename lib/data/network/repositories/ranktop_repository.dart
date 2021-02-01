import 'package:flutter_base/domain/entities/ranktop_model.dart';
import 'package:flutter_base/domain/interfaces/ranktop_interface.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

import '../api_constant.dart';

class RankTopRepository implements RankTopInterface {
  final Dio dio;
  RankTopRepository({this.dio});

  @override
  Future<List<This>> getListRankTop() async {
    try {
      final response = await dio.get(ApiConstant.RANKTOP,
          options: await HeaderNetWorkConstant.getOptionsWithToken());
      return (response.data['this'] as List).map((e) => This.fromJson(e)).toList();
    } on DioError catch (e) {
      return Future.error(e.response.data);
    }
  }

}