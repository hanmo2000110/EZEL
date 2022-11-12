import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezel/controllers/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import '../models/UserData.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  UserController user = Get.find<UserController>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> firebaseLogin(String email, String password) async {
    try {
      // 로그인 기능 구현
      user.userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await firestore
          .collection('Users')
          .doc(user.userCredential.user!.uid)
          .get()
          .then((value) {
        user.user = UserData.fromJson(value.data()!);
      });

      print(user.user);

      // HomePage 로 이동
      Get.offAndToNamed('/home');
    } catch (e) {
      if (e.toString().contains('invalid-email')) {
        Get.snackbar(
          'error',
          "invalid-email",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (e.toString().contains('user-disabled')) {
        Get.snackbar(
          'error',
          "user-disabled",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (e.toString().contains('user-not-found')) {
        Get.snackbar(
          'error',
          "User-Not-Found",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (e.toString().contains('wrong-password')) {
        Get.snackbar(
          'error',
          "wrong-password",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        print(e);
      }
    }
  }

  Future<void> firebaseRegister(String email, String password, name) async {
    try {
      // 회원가입 기능 구현
      user.userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // 가입에 성공했다면 바로 로그인 시도
      await auth.signInWithEmailAndPassword(email: email, password: password);

      // firestore 에 방금 가입한 사용자 정보 생성
      firestore.collection('Users').doc(user.userCredential.user!.uid).set(({
            'email': email,
            'name': name,
            'password': password,
            'isAdmin': false,
            'createdDate': FieldValue.serverTimestamp(),
          }));

      // user_controller 에 방금 가입한 사용자 정보 저장
      user.updateUserData(
        email: email,
        name: name,
        isAdmin: false,
      );

      // HomePage 로 이동
      Get.offAndToNamed('/home');
    } catch (e) {
      if (e.toString().contains('email-already-in-use')) {
        Get.snackbar(
          'error',
          "email-already-in-use",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (e.toString().contains('invalid-email')) {
        Get.snackbar(
          'error',
          "invalid-email",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (e.toString().contains('operation-not-allowed')) {
        Get.snackbar(
          'error',
          "operation-not-allowed",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (e.toString().contains('weak-password')) {
        Get.snackbar(
          'error',
          "weak-password",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        print(e);
      }
    }
  }
}
