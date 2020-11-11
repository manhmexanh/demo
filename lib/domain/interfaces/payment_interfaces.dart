import 'package:flutter_base/domain/entities/payment_model.dart';

abstract class PaymentInterface {
  Future<List<PaymentModel>> getPayments();
}