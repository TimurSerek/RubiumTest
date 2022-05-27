import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../routes/routes.dart';

class LoginController extends GetxController {
  RxBool validated = false.obs;
  final TextEditingController userNameController = TextEditingController();

  void checkLogin(){
    final userName = userNameController.text.trim();

    if(userName.isNotEmpty && validated.value){
      GetStorage().write('isUserLogin', true);
      GetStorage().write('userName', userName);
      Get.toNamed(Routes.userList);
    }
  }

  void enableLoginButtonIfValidated() {
    validated.value = userNameController.text.isNotEmpty
        ? true
        : false;
  }

  @override
  void dispose() {
    userNameController.dispose();
    super.dispose();
  }
}
