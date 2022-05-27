
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../controller/user_list_controller.dart';

class UserDetailsView extends GetView<UserListController>{
  const UserDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              CircleAvatar(
                  radius: 70,
                 backgroundImage: NetworkImage(controller.selectedUser().first.picture?.large ?? ''),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(controller.selectedUser().first.name?.first ?? ''),
              const SizedBox(
                height: 10.0,
              ),
              Text(controller.selectedUser().first.location?.city ?? ''),
            ],
          ),
        ),
      ),
    );
  }

}