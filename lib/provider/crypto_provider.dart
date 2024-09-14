import 'package:cryptocurrency_app/local_storage/all_local_storage.dart';
import 'package:cryptocurrency_app/model/currency_model.dart';
import 'package:cryptocurrency_app/service/Crypto_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CryptoProvider extends ChangeNotifier {
  List<CurrencyModel> cryptoData = [];
  CurrencyModel searching = CurrencyModel();
  bool isLoading = true;
  String searchText = '';

  CryptoProvider() {
    fetchData();
  }

  Future<void> fetchData({String? searchText}) async {
    List<dynamic> _markets = await CryptoApi.getCrypto(searchText);
    List<String> favorite = await LocalStorage.fetchFavorite();
    List<CurrencyModel> temp = []; // Temporary list to avoid duplicate data....
    for (var market in _markets) {
      CurrencyModel newCrypto = CurrencyModel.fromJson(market);
      temp.add(newCrypto);
      //  checking newCrypto is favourite or not by its id...
      if (favorite.contains(newCrypto.id!)) {
        newCrypto.isFavorite = true;
      }
    }
    cryptoData = temp;
    isLoading = false;
    notifyListeners();

// auto refresh by time.....
    // Timer(const Duration(seconds: 3), () {
    //   fetchData();
    //   log('data Updated');
    // });
  }

  CurrencyModel fetchDatabyId(String id) {
    CurrencyModel crypto =
        cryptoData.where((element) => element.id == id).toList()[0];
    return crypto;
  }

  void addFavorite(CurrencyModel crypto) async {
    int indexOfCrypto = cryptoData.indexOf(crypto);
    cryptoData[indexOfCrypto].isFavorite = true;
    await LocalStorage.addFavorite(crypto.id!);
    notifyListeners();
  }

  void removeFavorite(CurrencyModel crypto) async {
    int indexOfCrypto = cryptoData.indexOf(crypto);
    cryptoData[indexOfCrypto].isFavorite = false;
    await LocalStorage.removeFavorite(crypto.id!);
    notifyListeners();
  }
}
