import 'package:ezel/controllers/auth_controller.dart';
import 'package:ezel/controllers/user_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<UserController>(UserController(), permanent: true);
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
