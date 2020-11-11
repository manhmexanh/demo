import 'package:flutter_base/app/page/payment/payment_controller.dart';
import 'file:///C:/Tranning/demo/lib/data/network/repositories/payment_repository.dart';
import 'package:flutter_base/domain/interfaces/payment_interfaces.dart';
import 'package:get/get.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentInterface>(() => PaymentRepository(dio: Get.find()));
    Get.lazyPut(() => PaymentController(paymentInterface: Get.find()));
  }
}