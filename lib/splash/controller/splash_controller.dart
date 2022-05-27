import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 4));
    checkIfUserIsAlreadyAuthenticatedOrNotAndRouteToPage();
    super.onReady();
  }

  void checkIfUserIsAlreadyAuthenticatedOrNotAndRouteToPage() async {
    final isUserLogin = await GetStorage().read('isUserLogin');

    if (isUserLogin != null && isUserLogin == true) {
      Get.offNamed(Routes.userList);
    } else {
      Get.offNamed(Routes.login);
    }
  }
}
