import 'package:ezel/controllers/auth_controller.dart';
import 'package:ezel/screens/login_page.dart';
import 'package:ezel/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../widgets/drawer.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _rePassword = '';
  String _name = '';
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: appbar('Register Page'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    width: Get.width / 3,
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      onSaved: (newValue) {
                        setState(() {
                          _email = newValue as String;
                        });
                      },
                      validator: (value) {
                        if (value == "") return "Email을 입력하시오";
                        if (!value!.contains('@')) return "올바른 Email을 입력하시오";
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width / 3,
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      onSaved: (newValue) {
                        setState(() {
                          _name = newValue as String;
                        });
                      },
                      validator: (value) {
                        return value == '' ? "이름을 입력하세요" : null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width / 3,
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      obscureText: true,
                      onChanged: (newValue) {
                        setState(() {
                          _password = newValue as String;
                        });
                      },
                      validator: (value) {
                        if (value == "") return "비밀번호를 입력하시오";
                        if (value!.length < 7) return "7자 이상의 비밀번호를 입력하세요";
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width / 3,
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      obscureText: true,
                      onSaved: (newValue) {
                        setState(() {
                          _rePassword = newValue as String;
                        });
                      },
                      validator: (value) {
                        if (_password != value)
                          return "Re-Password should be same with Password";
                        if (value == "") return "비밀번호를 입력하시오";
                        if (value!.length < 7) return "7자 이상의 비밀번호를 입력하세요";
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Re-Password',
                        // hintText: 'What do people call you?',
                        // icon: Icon(Icons.android),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width / 3,
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            print("Back");
                            Get.offAndToNamed('/login');
                            // Get.offAll(() => LoginPage());
                          },
                          child: Ink(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.lightBlue[100],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              width: Get.width / 7,
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: Text("Back"),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              authController.firebaseRegister(
                                  _email, _password, _name);
                            }
                          },
                          child: Ink(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.lightBlue[100],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              width: Get.width / 7,
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: Text("Register"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
