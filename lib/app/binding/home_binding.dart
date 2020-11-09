import 'package:flutter_base/app/page/home/home_controller.dart';
import 'package:flutter_base/data/network/repositories/home_repository.dart';
import 'package:flutter_base/domain/interfaces/home_interfaces.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeInterface>(() => HomeRepository(dio: Get.find()));
    Get.lazyPut(() => HomeController(homeInterface: Get.find()));
  }
}
