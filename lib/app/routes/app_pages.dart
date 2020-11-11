import 'package:flutter_base/app/binding/home_binding.dart';
import 'package:flutter_base/app/binding/send_money_binding.dart';
import 'package:flutter_base/app/page/home/views/home_view.dart';
import 'package:flutter_base/app/page/send_money/views/send_money_view.dart';
import 'package:flutter_base/app/binding/payment_binding.dart';
import 'package:flutter_base/app/page/payment/views/payment_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(name: Routes.HOME, page: () => HomeView(), binding: HomeBinding()),
    GetPage(
        name: Routes.SEND_MONEY,
        page: () => SendMoneyView(),
        binding: SendMoneyBinding()),
    GetPage(
      name: Routes.PAYMENT,
      page: () => PaymentView(),
      binding: PaymentBinding(),
    ),
  ];
}
