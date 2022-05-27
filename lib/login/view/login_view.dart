import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                onChanged: (_){
                  controller.enableLoginButtonIfValidated();
                },
                controller: controller.userNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                controller.checkLogin();
              },
              style: ButtonStyle(
                backgroundColor: controller.validated()
                    ? MaterialStateProperty.all(Colors.blue)
                    : MaterialStateProperty.all(Colors.grey),
              ),
              child: const Text('Войти'),
            )
          ],
        ),
      ),
    );
  }
}
