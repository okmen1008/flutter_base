import 'package:dio/dio.dart';
import 'package:flutter_base/domain/entities/product_model.dart';
import 'package:flutter_base/domain/interfaces/product_interface.dart';

import '../api_constant.dart';

class ProductRepository implements ProductInterface {
  final Dio dio;
  ProductRepository({this.dio});

  @override
  Future<List<ProductModel>> getListProduct() async {
    try {
      final response = await dio.get(ApiConstant.PRODUCT,
          options: await HeaderNetWorkConstant.getOptionsWithToken());
    return (response.data as List).map((e) => ProductModel.fromJson(e)).toList();
    } on DioError catch (e) {
    return Future.error(e.response.data);
    }
  }

  @override
  Future<List<String>> getListCategoriesProduct() async {
    try {
      final response = await dio.get(ApiConstant.CATEGORIES,
          options: await HeaderNetWorkConstant.getOptionsWithToken());
      return (response.data as List).map((e) => e.toString()).toList();
    } on DioError catch (e) {
      return Future.error(e.response.data);
    }
  }

}