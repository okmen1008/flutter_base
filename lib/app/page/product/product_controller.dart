import 'package:flutter/material.dart';
import 'package:flutter_base/domain/entities/error_model.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:flutter_base/app/base/controller.dart';
import 'package:flutter_base/data/network/repositories/product_repository.dart';
import 'package:flutter_base/domain/entities/product_model.dart';

class ProductController extends Controller {
  final ProductRepository productRepository;

  ProductController({@required this.productRepository});

  final listProduct = List<ProductModel>().obs;
  final listSelected = List<ProductModel>().obs;
  final listSortedProduct = List<ProductModel>().obs;
  final listCategory = List<String>().obs;
  final listSort = List<String>().obs;

  Future<void> fetchListProduct({VoidCallback callback}) async {
    status(Status.loading);

    productRepository.getListProduct().then(
            (value) {
              listProduct.clear();
              listProduct.addAll(value);

              listSortedProduct.clear();
              listSortedProduct.addAll(value);

              status(Status.success);

              callback?.call();
            },
      onError: (err) {
        if(err is ErrorModel){
          // TODO: callbackError
        }
        status(Status.error);
      },
    );
  }

  Future<void> fetchListCategory({VoidCallback callback}) async {
    status(Status.loading);

    productRepository.getListCategoriesProduct().then(
            (value) {
              listCategory.clear();
              listCategory.addAll(value);
              status(Status.success);

              callback?.call();
            },
      onError: (err) {
        if(err is ErrorModel){
          // TODO: callbackError
        }
        status(Status.error);
      },
    );
  }

  sortByCategory() {
    if (listSort.length != 0) {
      listSortedProduct.clear();
      listProduct.forEach((productItem) {
        if (listSort.contains(productItem.categoryName)) {
          listSortedProduct.add(productItem);
        }
      });
    } else {
      listSortedProduct.clear();
      listSortedProduct.addAll(listProduct);
    }
  }

  @override
  void onConnected() {
    // TODO: implement onConnected
    super.onConnected();
  }
}