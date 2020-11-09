import 'package:dio/dio.dart';
import 'package:flutter_base/app/base/controller.dart';
import 'package:flutter_base/domain/entities/crypto_model.dart';
import 'package:flutter_base/domain/interfaces/home_interfaces.dart';
import 'package:get/get.dart';

enum Status { loading, success, error }

class HomeController extends Controller {
  HomeController({this.homeInterface});

  /// inject repo abstraction dependency
  final HomeInterface homeInterface;

  /// create a reactive status from request with initial value = loading
  final status = Status.loading.obs;

  final listCrypto = List<CryptoModel>().obs;

  Future<void> fetchDataFromApi({VoidCallback action}) async {
    return homeInterface.getListCrypto().then(
      (data) {
        print(data);
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
