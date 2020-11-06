import 'package:flutter_base/domain/entities/contact_model.dart';

abstract class SendMoneyInterface {
  Future<List<ContactModel>> getContacts();
}
