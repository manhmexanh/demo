import 'package:flutter/material.dart';
import 'package:flutter_base/app/base/view.dart';
import 'package:flutter_base/app/page/home/home_controller.dart';
import 'package:flutter_base/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeView extends ViewStateLess<HomeController> {
  final RefreshController _refreshController = RefreshController();

  @override
  Future<bool> willPopCallBack() {
    return super.willPopCallBack();
  }

  @override
  Widget buildPage(context) {
    controller.fetchDataFromApi();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [

          FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26),
                side: BorderSide(color: Colors.grey)),
            child: Text('Send Money'),
            onPressed: () {
              Get.toNamed(Routes.SEND_MONEY);
            },
          ) ,
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26),
                  side: BorderSide(color: Colors.grey)),
              child: Text('Payment'),
              onPressed: () {
                Get.toNamed(Routes.PAYMENT);
              },
            ),
          ],
        )
      );
  }
}
