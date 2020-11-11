import 'package:dio/dio.dart';
import 'package:flutter_base/app/base/controller.dart';
import 'package:flutter_base/domain/entities/payment_model.dart';
import 'package:flutter_base/domain/interfaces/payment_interfaces.dart';
import 'package:get/get.dart';

enum Status { loading, success, error }

class PaymentController extends Controller {
  PaymentController({this.paymentInterface});

  /// inject repo abstraction dependency
  final PaymentInterface paymentInterface;

  /// create a reactive status from request with initial value = loading
  final status = Status.loading.obs;

  final listCrypto = List<PaymentModel>().obs;

  Future<void> fetchDataFromApi({VoidCallback action}) async {
    return paymentInterface.getPayments().then(
          (data) {
        listCrypto.clear();
        listCrypto.addAll(data);
        action?.call();
        status(Status.success);
      },

      /// In case of error, print the error and change the status
      /// to Status.error
      onError: (err) {
        print("$err");
        return status(Status.error);
      },
    );
  }
}
