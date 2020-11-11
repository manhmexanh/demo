import 'package:dio/dio.dart';
import 'package:flutter_base/data/network/api_constant.dart';
import 'package:flutter_base/domain/entities/payment_model.dart';
import 'package:flutter_base/domain/interfaces/payment_interfaces.dart';

class PaymentRepository implements PaymentInterface {
  PaymentRepository({this.dio});

  final Dio dio;

  @override
  Future<List<PaymentModel>> getPayments() async {
    try {
      final response = await dio.get(
          CategoriesApiConstant.CRYPTOCURRENCY +
              SubEndpointApiConstant.LISTINGS +
              EndpointApiConstant.LATEST,
          queryParameters: {'start': 1, 'limit': 10, 'convert': 'USD'});
      return (response.data['data'] as List)
          .map((e) => PaymentModel.fromJson(e)).toList();
    } on DioError catch (e) {
      print(e.response.data);
      return Future.error(e.toString());
    }
  }
}
