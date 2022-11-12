import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Drawer drawer() {
  return Drawer(
    child: ListView(
      children: [
        const DrawerHeader(
          child: Text('Drawer Header'),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: const Text('에젤 회원'),
          onTap: () {
            Get.snackbar('개발중', "아직 개발중입니다",
                snackPosition: SnackPosition.BOTTOM);
          },
        ),
        ListTile(
          title: const Text('기도방'),
          onTap: () {
            Get.snackbar('개발중', "아직 개발중입니다",
                snackPosition: SnackPosition.BOTTOM);
          },
        ),
        ListTile(
          title: const Text('안식관'),
          onTap: () {
            Get.snackbar('개발중', "아직 개발중입니다",
                snackPosition: SnackPosition.BOTTOM);
          },
        ),
        ListTile(
          title: const Text('MK 장학관'),
          onTap: () {
            Get.snackbar('개발중', "아직 개발중입니다",
                snackPosition: SnackPosition.BOTTOM);
          },
        ),
        ListTile(
          title: const Text('세미나'),
          onTap: () {
            Get.snackbar('개발중', "아직 개발중입니다",
                snackPosition: SnackPosition.BOTTOM);
          },
        ),
        ListTile(
          title: const Text('선교사'),
          onTap: () {
            Get.snackbar('개발중', "아직 개발중입니다",
                snackPosition: SnackPosition.BOTTOM);
          },
        ),
      ],
    ),
  );
}
