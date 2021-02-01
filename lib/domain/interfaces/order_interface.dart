import 'package:flutter_base/domain/entities/profile_model.dart';
import 'package:flutter_base/domain/entities/settings_model.dart';

abstract class OrderInterface {
  Future<ProfileModel> getProfile();
  Future<Setting> getSettings();
}