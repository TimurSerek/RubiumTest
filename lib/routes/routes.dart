import 'package:get/get.dart';

import '../login/controller/login_controller.dart';
import '../login/view/login_view.dart';
import '../splash/controller/splash_controller.dart';
import '../splash/view/splash_view.dart';
import '../user_list/controller/user_list_controller.dart';
import '../user_list/view/user_details_view.dart';
import '../user_list/view/user_list_view.dart';

abstract class Routes {
  static const splash = '/splash';
  static const login = '/login';
  static const userList = '/userList';
  static const detailsUser = '/detailsUser';
}

abstract class AppPages {
  static String initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      binding: BindingsBuilder.put(() => SplashController()),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: BindingsBuilder.put(() => LoginController()),
    ),
    GetPage(
      name: Routes.userList,
      page: () => const UserListView(),
      binding: BindingsBuilder.put(() => UserListController()),
    ),
    GetPage(
      name: Routes.detailsUser,
      page: () => const UserDetailsView(),
      binding: BindingsBuilder.put(() => UserListController()),
    ),
  ];
}
