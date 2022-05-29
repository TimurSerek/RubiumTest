import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/user_list_controller.dart';

class UserListView extends GetView<UserListController> {
  const UserListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: !controller.isSearching()
              ? Center(child: Text(controller.userName()))
              : TextField(
                  onChanged: (String text) {
                    controller.searchQuery.value = text;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: 'Search',
                    contentPadding: EdgeInsets.all(16.0),
                  ),
                ),
          actions: [
            !controller.isSearching()
            ? PopupMenuButton(
              onSelected: (value){
                  if(value == 'search'){
                    controller.showSearchTextField();
                  } else if(value == 'exit'){
                    controller.toLoginScreen();
                  }
              },
                itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 'search',
                          child: Row(
                        children: const [
                          Icon(Icons.search, color: Colors.black,),
                          SizedBox(width: 10),
                          Text('Поиск'),
                        ],
                      )),
                      PopupMenuItem(
                        value: 'exit',
                          child: Row(
                        children: const [
                          Icon(Icons.exit_to_app, color: Colors.black,),
                          SizedBox(width: 10),
                          Text('Выход'),
                        ],
                      ))
                    ])
            : IconButton(
              onPressed: () {
                controller.showSearchTextField();
              },
              icon: const Icon(Icons.clear),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () => controller.getUserList(),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 20.0, right: 16.0),
            child: ListView(
              children: controller.searchQuery() != ''
                  ? controller.userList().map(
                      (user) {
                        return user.name!.first!
                                .toLowerCase()
                                .contains(controller.searchQuery.toLowerCase())
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    final index =
                                        controller.userList.indexOf(user);
                                    controller.showUserDetails(index);
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white70,
                                          border: Border.all(),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0, horizontal: 8.0),
                                            child: CircleAvatar(
                                              radius: 30,
                                              backgroundImage: NetworkImage(
                                                  user.picture?.medium ?? ''),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(user.name?.first ?? ''),
                                        ],
                                      )),
                                ),
                              )
                            : Container();
                      },
                    ).toList()
                  : controller.userList().map(
                      (user) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              final index = controller.userList.indexOf(user);
                              controller.showUserDetails(index);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white70,
                                    border: Border.all(),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 8.0),
                                      child: CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage(
                                            user.picture?.medium ?? ''),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(user.name?.first ?? ''),
                                  ],
                                )),
                          ),
                        );
                      },
                    ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
