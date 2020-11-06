import 'package:flutter_base/app/page/send_money/send_money_controller.dart';
import 'package:flutter_base/data/network/send_money_repository.dart';
import 'package:flutter_base/domain/interfaces/send_money_interfaces.dart';
import 'package:get/get.dart';

class SendMoneyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SendMoneyInterface>(
        () => SendMoneyRepository(dio: Get.find(tag: 'abc')));
    Get.lazyPut(() => SendMoneyController(sendMoneyInterface: Get.find()));
  }
}
