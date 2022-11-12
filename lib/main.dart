import 'package:ezel/firebase_options.dart';
import 'package:ezel/my_app.dart';
import 'package:ezel/screens/home_page.dart';
import 'package:ezel/screens/login_page.dart';
import 'package:ezel/screens/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'bindings/binding.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await MainBinding().dependencies();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    getPages: [
      GetPage(
        name: '/home',
        page: () => HomePage(),
        binding: MainBinding(),
      ),
      GetPage(
        name: '/login',
        page: () => LoginPage(),
        binding: MainBinding(),
      ),
      GetPage(
        name: '/register',
        page: () => RegisterPage(),
        binding: MainBinding(),
      ),
    ],
  ));
}
