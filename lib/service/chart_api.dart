import 'dart:convert';

import 'package:cryptocurrency_app/model/chart_model.dart';
import 'package:http/http.dart' as http;

class ChartApi {
  Future<List<dynamic>> getCharts(String id, String days) async {
    try {
      String url =
          'https://api.coingecko.com/api/v3/coins/${id}/ohlc?vs_currency=inr&days=$days';
      // var response = await http.get(Uri.parse(url));
      var response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'applicaiton/json',
        'Accept': 'applicaiton/json'
      });
      Iterable decodeResponse = jsonDecode(response.body);
      List<ChartModel> charts =
          decodeResponse.map((e) => ChartModel.fromJson(e)).toList();
      return charts;
    } catch (e) {
      print(e);
      return [];
    }
  }
}