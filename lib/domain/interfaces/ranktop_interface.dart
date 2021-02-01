import 'package:flutter_base/domain/entities/ranktop_model.dart';

abstract class RankTopInterface {
  Future<List<This>> getListRankTop();
}