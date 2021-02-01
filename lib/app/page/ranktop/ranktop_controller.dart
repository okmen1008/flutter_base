import 'package:flutter/material.dart';
import 'package:flutter_base/app/base/controller.dart';
import 'package:flutter_base/domain/entities/ranktop_model.dart';
import 'package:flutter_base/domain/interfaces/ranktop_interface.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class RankTopController extends Controller {
  final RankTopInterface rankTopInterface;
  RankTopController({@required this.rankTopInterface});

  final listRankTop = List<This>().obs;

  Future<void> fetchListRankTop({VoidCallback callback}) async {
    status(Status.loading);
    rankTopInterface.getListRankTop().then(
          (value) {
            listRankTop.addAll(value);
        status(Status.success);

        callback?.call();
      },
      onError: (err) {
        status(Status.error);
      },
    );
  }

  Future<void> sortByAZ() async {
    listRankTop.sort((a, b) => a.ranking - b.ranking);
  }

  Future<void> sortByZA() async {
    listRankTop.sort((a, b) => b.ranking - a.ranking);
  }


}