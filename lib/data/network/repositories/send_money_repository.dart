import 'package:dio/dio.dart';
//import 'package:flutter_base/data/api_constant.dart';
import 'package:flutter_base/domain/entities/contact_model.dart';
import 'package:flutter_base/domain/interfaces/send_money_interfaces.dart';

class SendMoneyRepository implements SendMoneyInterface {
  SendMoneyRepository({this.dio});

  final Dio dio;

  @override
  Future<List<ContactModel>> getContacts() async {
    try {
//      final response = await dio.get(ApiConstant.API_COVID);
      final List<ContactModel> contacts = [
        ContactModel(name: 'Leslee Moss', role: 'Sister'),
        ContactModel(name: 'Sun Jun', role: 'Brother'),
        ContactModel(name: 'Sebastian Bennett', role: 'Wife'),
        ContactModel(name: 'Carmen Beltrán', role: 'Sister'),
        ContactModel(name: 'Leslee Moss', role: 'Sister'),
        ContactModel(name: 'Sun Jun', role: 'Brother'),
        ContactModel(name: 'Sebastian Bennett', role: 'Wife'),
        ContactModel(name: 'Carmen Beltrán', role: 'Sister'),
        ContactModel(name: 'Leslee Moss', role: 'Sister'),
        ContactModel(name: 'Sun Jun', role: 'Brother'),
        ContactModel(name: 'Sebastian Bennett', role: 'Wife'),
        ContactModel(name: 'Carmen Beltrán', role: 'Sister')
      ];

      return Future.value(contacts);
    } on Exception catch (e) {
      print(e.toString());
      return Future.error(e.toString());
    }
  }
}
