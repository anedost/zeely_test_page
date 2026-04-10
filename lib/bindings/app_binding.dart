import 'package:get/get.dart';
import 'package:zeely_test_page/controllers/avatar_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AvatarController());
  }
}
