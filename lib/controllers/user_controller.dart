import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/UserData.dart';

class UserController extends GetxController {
  late UserCredential userCredential;
  late UserData user;

  void updateUserData({
    required String email,
    required String name,
    required bool isAdmin,
  }) {
    user = UserData(email: email, name: name, isAdmin: isAdmin);
  }
}
