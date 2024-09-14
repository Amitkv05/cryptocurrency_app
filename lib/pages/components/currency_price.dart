import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:cryptocurrency_app/pages/detail_page.dart';
import 'package:cryptocurrency_app/provider/crypto_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CurrencyPrice extends StatelessWidget {
  const CurrencyPrice({super.key, required this.theme});

  final Color theme;

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Consumer<CryptoProvider>(builder: (context, cryptoProvider, child) {
      if (cryptoProvider.isLoading == true) {
        return const Center(child: CircularProgressIndicator());
      } else {
        if (cryptoProvider.cryptoData.length > 0) {
          return RefreshIndicator(
            onRefresh: () async {
              await cryptoProvider.fetchData();
            },
            child: Column(
              children: [
                ListView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    // itemCount: cryptoProvider.cryptoData.length,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      final currencyCrypto = cryptoProvider.cryptoData[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => DetailPage(
                                currencyData: currencyCrypto.id!,
                              ));
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                              child: Image.network(currencyCrypto.image!)),
                          title: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currencyCrypto.name!,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(currencyCrypto.symbol!.toUpperCase())
                                ],
                              ),
                              SizedBox(width: myWidth * 0.04),
                              Container(
                                color: Colors.grey.shade200,
                                height: myHeight * 0.05,
                                width: myWidth * 0.14,
                                child: Sparkline(
                                  data: currencyCrypto.sparklineIn7D!.price!,
                                  lineWidth: 2.0,
                                  lineColor: currencyCrypto
                                              .priceChangePercentage24H! >=
                                          0
                                      ? Colors.green
                                      : Colors.red,
                                  fillMode: FillMode.below,
                                  fillGradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      stops: const [0.0, 0.7],
                                      colors: currencyCrypto
                                                  .priceChangePercentage24H! >=
                                              0
                                          ? [
                                              Colors.green,
                                              Colors.green.shade100
                                            ]
                                          : [Colors.red, Colors.red.shade100]),
                                ),
                              ),
                            ],
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "₹${currencyCrypto.currentPrice!}",
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent),
                              ),
                              Builder(builder: (context) {
                                double priceChange24h =
                                    currencyCrypto.priceChange24H!;
                                double priceChangePercentage24h =
                                    currencyCrypto.priceChangePercentage24H!;
                                if (priceChange24h < 0) {
                                  // negative
                                  return Text(
                                    '${priceChangePercentage24h.toStringAsFixed(2)}%, (₹${priceChange24h.toStringAsFixed(4)})',
                                    style: const TextStyle(color: Colors.red),
                                  );
                                } else {
                                  // positive
                                  return Text(
                                    '${priceChangePercentage24h.toStringAsFixed(2)}%, (₹${priceChange24h.toStringAsFixed(4)})',
                                    style: const TextStyle(color: Colors.green),
                                  );
                                }
                              })
                            ],
                          ),
                        ),
                      );
                    }),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: myWidth * 0.05, vertical: myHeight * 0.0),
                  child: const Row(
                    children: [
                      Text(
                        'Recommend to Buy',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: myHeight * 0.18,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      // itemCount: cryptoProvider.cryptoData.length,
                      itemBuilder: (context, index) {
                        final currencyCrypto = cryptoProvider.cryptoData[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => DetailPage(
                                  currencyData: currencyCrypto.id!,
                                ));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: myWidth * 0.03,
                              vertical: myHeight * 0.02,
                            ),
                            child: Container(
                              // width: myWidth * 0.35,
                              padding: EdgeInsets.symmetric(
                                horizontal: myWidth * 0.03,
                                vertical: myHeight * 0.02,
                              ),
                              decoration: BoxDecoration(
                                color: theme,
                                // color: Theme.of(context).primaryColor,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: Colors.grey.shade200,
                                    offset: Offset(0, 1),
                                    spreadRadius: 3,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: myHeight * 0.04,
                                        child: CircleAvatar(
                                          child: Image.network(
                                              currencyCrypto.image!),
                                        ),
                                      ),
                                      SizedBox(width: myWidth * 0.01),
                                      Text(
                                        currencyCrypto.name!,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: myHeight * 0.01,
                                  ),
                                  Text(
                                    "₹${currencyCrypto.currentPrice!}",
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent),
                                  ),
                                  Builder(builder: (context) {
                                    double priceChange24h =
                                        currencyCrypto.priceChange24H!;
                                    double priceChangePercentage24h =
                                        currencyCrypto
                                            .priceChangePercentage24H!;
                                    if (priceChange24h < 0) {
                                      // negative
                                      return Text(
                                        '${priceChangePercentage24h.toStringAsFixed(2)}%, (₹${priceChange24h.toStringAsFixed(4)})',
                                        style: const TextStyle(
                                            fontSize: 11, color: Colors.red),
                                      );
                                    } else {
                                      // positive
                                      return Text(
                                        '${priceChangePercentage24h.toStringAsFixed(2)}%, (₹${priceChange24h.toStringAsFixed(4)})',
                                        style: const TextStyle(
                                            fontSize: 11, color: Colors.green),
                                      );
                                    }
                                  }),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          );
        }
        return const Text('No Data Found!');
      }
    });
  }
}
