import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class CryptoApi {
  static Future<List<dynamic>> getCrypto(String? searchText) async {
    try {
      String url =
          'https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=50&page=1&sparkline=true';
      if (searchText != null) {
        url += "?search=$searchText";
      }
      var response = await http.get(Uri.parse(url));
      var decodeResponse = jsonDecode(response.body);
      List<dynamic> markets = decodeResponse as List<dynamic>;
      return markets;
    } catch (e) {
      print('Error $e');
      return [];
    }
  }
}
