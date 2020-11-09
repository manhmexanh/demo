import 'package:flutter/material.dart';
import 'package:flutter_base/app/base/view.dart';
import 'package:get/get.dart';
import 'package:flutter_base/app/routes/app_pages.dart';

class HomeView extends ViewStateLess {
  @override
  Future<bool> willPopCallBack() {
    return super.willPopCallBack();
  }

  @override
  Widget buildPage(context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(26),
              side: BorderSide(color: Colors.grey)),
          child: Text('Send Money'),
          onPressed: () {
            Get.toNamed(Routes.SEND_MONEY);
          },
        ),
      ),
    );
  }
}
