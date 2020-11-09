
import 'package:flutter_base/domain/entities/crypto_model.dart';

abstract class HomeInterface {
  Future<List<CryptoModel>> getListCrypto();
}
