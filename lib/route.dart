import 'package:get/get.dart';
import 'package:getx_app/pages/drop_search.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';

class Routes {
  static final myRoutes = [
    GetPage(
      name: '/loginPage',
      page: () => LoginPage(),
    ),
    GetPage(
      name: '/homePage',
      page: () => HomePage(),
    ),
    GetPage(
      name: '/homePageNew',
      page: () => MyHomePage(),
    ),
  ];
}
