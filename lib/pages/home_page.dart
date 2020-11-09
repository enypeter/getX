import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_app/controller/home_controller.dart';
import 'package:getx_app/controller/login_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  final LoginController _loginController = Get.find();
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    print(_loginController.emailTextController.text);
    ScreenUtil.init(context,
        designSize: Size(374, 812), allowFontScaling: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offNamed('/homePageNew');
          },
          icon: Icon(Icons.home),
        ),
        title: Text(
          'Dashboard',
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text(
              'Welcome ${_loginController.emailTextController.text}',
              style: GoogleFonts.exo2(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: _homeController.userListData.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      _homeController.userListData[index].firstName,
                    ),
                    subtitle: Text(
                      _homeController.userListData[index].email,
                    ),
                    trailing: Image.network(
                      _homeController.userListData[index].avatar,
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                    leading: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        _homeController.deleteItem(index);
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
