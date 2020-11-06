import 'package:flutter_base/app/base/controller.dart';
import 'package:flutter_base/domain/entities/contact_model.dart';
import 'package:flutter_base/domain/interfaces/send_money_interfaces.dart';
import 'package:get/get.dart';

enum Status { loading, success, error }

class SendMoneyController extends Controller {
  SendMoneyController({this.sendMoneyInterface});

  /// inject repo abstraction dependency
  final SendMoneyInterface sendMoneyInterface;

  /// create a reactive status from request with initial value = loading
  final status = Status.loading.obs;

  final contacts = List<ContactModel>().obs;

  final filterContacts = List<ContactModel>().obs;

  final keyword = Rx<String>();

  /// When the controller is initialized, make the http request
  @override
  void onInit() => fetchDataFromApi();

  Future<void> fetchDataFromApi() async {
    return sendMoneyInterface.getContacts().then(
      (data) {
        contacts.addAll(data);
        filterContacts.addAll(data);
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
