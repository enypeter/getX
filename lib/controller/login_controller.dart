import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/apis/api_docs.dart';

class LoginController extends GetxController {
  TextEditingController emailTextController;
  TextEditingController passwordTextController;

  @override
  void onInit() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    super.onInit();
  }

  void apiLogin() async {
    Get.dialog(
        Center(
          child: CircularProgressIndicator(),
        ),
        barrierDismissible: false);
    Request request = Request(url: login, body: {
      'email': emailTextController.text,
      'password': passwordTextController.text,
    });
    request.post().then((value) {
      Get.back();
      Get.offNamed('/homePage');
    }).catchError((onError) {});
  }

  @override
  void onClose() {
    emailTextController?.dispose();
    passwordTextController?.dispose();
    super.onClose();
  }
}
