import 'package:dio/dio.dart';

class BaseApiConstant {
  static const BASE_URL = 'https://pro-api.coinmarketcap.com/v1/';
  static const KEY = '7048e17d-402b-4912-b34c-a6a8e5972ddb';
  
  static BaseOptions buildBaseOption() =>
      BaseOptions(baseUrl: BASE_URL, headers: {
        'X-CMC_PRO_API_KEY': KEY,
        'Accept': 'application/json',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection' : 'keep-alive'
      });
}

class CategoriesApiConstant{
 static const CRYPTOCURRENCY = 'cryptocurrency/';
 static const EXCHANGE = 'exchange/';
 static const GLOBAL_METRICS = 'global-metrics/';
 static const TOOLS = 'tools/';
 static const BLOCKCHAIN = 'blockchain/';
 static const FIAT = 'fiat/';
 static const PARTNERS = 'partners/';
 static const KEY = 'key/';
}

class EndpointApiConstant{
  static const LATEST = 'latest';
  static const HISTORICAL = 'historical';
  static const INFO = 'info';
  static const MAP = 'map';
}

class SubEndpointApiConstant{
  static const LISTINGS = 'listings/';
  static const QUOTES = 'quotes/';
  static const MARKET_PAIRS = 'market-pairs/';
}
