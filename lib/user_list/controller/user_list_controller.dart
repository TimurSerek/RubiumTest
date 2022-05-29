import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rubium_test/model/user_model.dart';

import '../../model/user_model.dart';
import 'package:http/http.dart' as http;

import '../../routes/routes.dart';

class UserListController extends GetxController {
  RxBool isSearching = false.obs;
  RxString searchQuery = ''.obs;
  RxString userName = ''.obs;
  RxList<Results> userList = <Results>[].obs;
  RxList<Results> selectedUser = <Results>[].obs;

  @override
  Future<void> onInit() async {
    getUserList();
    userName.value = await GetStorage().read('userName');
    super.onInit();
  }

  void showSearchTextField() {
    isSearching.value = !isSearching.value;
    if (!isSearching.value) {
      searchQuery.value = '';
    }
  }

  Future getUserList() async {
    final url = Uri.parse('https://randomuser.me/api/?results=20');
    final response = await http.get(url);
    final userModel = Model.fromJson(jsonDecode(response.body));
    userList.value = userModel.results ?? [];
  }

  void showUserDetails(int index) {
    selectedUser.insert(0, userList[index]);
    Get.toNamed(Routes.detailsUser);
  }

  void toLoginScreen() {
    GetStorage().write('isUserLogin', false);
    GetStorage().write('userName', '');
    Get.offNamed(Routes.login);
  }

  void toUserList() {
    Get.back();
  }
}
