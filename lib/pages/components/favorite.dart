import 'package:cryptocurrency_app/model/currency_model.dart';
import 'package:cryptocurrency_app/pages/detail_page.dart';
import 'package:cryptocurrency_app/provider/crypto_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CryptoProvider>(builder: (context, cryptoProvider, child) {
      List<CurrencyModel> favorite = cryptoProvider.cryptoData
          .where((element) => element.isFavorite == true)
          .toList();
      if (favorite.length > 0) {
        return ListView.builder(
            itemCount: favorite.length,
            itemBuilder: (context, index) {
              CurrencyModel favCrypto = favorite[index];
              return ListTile(
                onTap: () {
                  Get.to(DetailPage(currencyData: favCrypto.id));
                },
                contentPadding: const EdgeInsets.all(0),
                leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.network(favCrypto.image!)),
                title: Row(
                  children: [
                    Flexible(
                      child: Text(
                        favCrypto.name!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          // color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    (favCrypto.isFavorite == false)
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                cryptoProvider.addFavorite(favCrypto);
                              });
                            },
                            child: const Icon(
                              CupertinoIcons.heart,
                              size: 30,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                cryptoProvider.removeFavorite(favCrypto);
                              });
                            },
                            child: const Icon(
                              CupertinoIcons.heart_fill,
                              color: Colors.red,
                              size: 30,
                            ),
                          )
                  ],
                ),
                subtitle: Text(favCrypto.symbol!.toUpperCase()),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "₹ ${favCrypto.currentPrice!.toStringAsFixed(4)}",
                      style: const TextStyle(
                        color: Color(0xff0395eb),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Builder(builder: (context) {
                      double priceChange24h = favCrypto.priceChange24H!;
                      double priceChangePercentage =
                          favCrypto.priceChangePercentage24H!;

                      if (priceChange24h < 0) {
                        // negative
                        return Text(
                          '${priceChangePercentage.toStringAsFixed(2)}%, (₹${priceChange24h.toStringAsFixed(4)})',
                          style: const TextStyle(color: Colors.red),
                        );
                      } else {
                        // positive
                        return Text(
                          '+${priceChangePercentage.toStringAsFixed(2)}%, (+₹${priceChange24h.toStringAsFixed(4)})',
                          style: const TextStyle(color: Colors.green),
                        );
                      }
                    })
                  ],
                ),
              );
            });
      } else {
        return const Center(
          child: Text(
            'No favourite yet',
            style: TextStyle(color: Colors.grey),
          ),
        );
      }
    });
  }
}
