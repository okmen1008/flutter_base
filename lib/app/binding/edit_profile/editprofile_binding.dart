import 'package:flutter_base/app/page/edit_profile/editprofile_controller.dart';
import 'package:flutter_base/data/network/repositories/editprofile_repository.dart';
import 'package:flutter_base/domain/interfaces/editprofile_interface.dart';
import 'package:get/get.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileInterface>(() => EditProfileRepository(dio: Get.find()));
    Get.lazyPut(() => EditProfileController(editProfileInterface: Get.find()));
  }

}
