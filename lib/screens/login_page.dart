import 'package:ezel/screens/register_page.dart';
import 'package:ezel/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../widgets/drawer.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: appbar('Login Page'),
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
                      obscureText: true,
                      onSaved: (newValue) {
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            print("register");
                            Get.offAndToNamed('/register');
                            // Get.offAll(() => RegisterPage());
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
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            print("login");
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              authController.firebaseLogin(_email, _password);
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
                                child: Text("Login"),
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
