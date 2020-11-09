import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_app/apis/api_docs.dart';
import 'package:getx_app/models/user_list_model.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  var userListData = List<Data>().obs;

  @override
  void onInit() {
    _apiGetUserList();
    super.onInit();
  }

  void _apiGetUserList() async {
    Future.delayed(
        Duration.zero,
        () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false));
    Request request = Request(url: userList, body: null);
    request.get().then((value) {
      UserListModel userListModel =
          UserListModel.fromJson(json.decode(value.body));
      userListData.value = userListModel.data;
      Get.back();
    }).catchError((onError) {
      print(onError);
    });
  }

  void deleteItem(int index) {
    userListData.removeAt(index);
  }
}
