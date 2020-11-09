import 'package:dio/dio.dart';
import 'package:flutter_base/data/network/api_constant.dart';
import 'package:flutter_base/domain/entities/crypto_model.dart';
import 'package:flutter_base/domain/interfaces/home_interfaces.dart';

class HomeRepository implements HomeInterface {
  HomeRepository({this.dio});

  final Dio dio;

  @override
  Future<List<CryptoModel>> getListCrypto() async {
    try {
      final response = await dio.get(
          CategoriesApiConstant.CRYPTOCURRENCY +
              SubEndpointApiConstant.LISTINGS +
              EndpointApiConstant.LATEST,
          queryParameters: {'start': 1, 'limit': 10, 'convert': 'USD'});
      return (response.data['data'] as List)
          .map((e) => CryptoModel.fromJson(e)).toList();
    } on DioError catch (e) {
      return Future.error(e.toString());

    }
  }
}
