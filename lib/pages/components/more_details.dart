import 'package:cryptocurrency_app/model/currency_model.dart';
import 'package:flutter/material.dart';

Column titleAnddetail(
    String name, String detail, CrossAxisAlignment crossAxisAlignment) {
  return Column(
    crossAxisAlignment: crossAxisAlignment,
    children: [
      Text(
        name,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(detail),
    ],
  );
}

Widget MoreDetails(CurrencyModel currentCrypto) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 18),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Price Change (24h)',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Builder(builder: (context) {
          double priceChange24h = currentCrypto.priceChange24H!;
          double percentageChange24h = currentCrypto.priceChangePercentage24H!;
          if (priceChange24h < 0) {
            return Text(
              '${percentageChange24h.toStringAsFixed(2)}%, (₹${priceChange24h.toString()})',
              style: const TextStyle(color: Colors.red, fontSize: 18),
            );
          } else {
            return Text(
              '${percentageChange24h.toStringAsFixed(2)}, (₹${priceChange24h.toString()})',
              style: const TextStyle(color: Colors.green, fontSize: 18),
            );
          }
        }),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            titleAnddetail(
              'Market Cap',
              '₹${currentCrypto.marketCap!}',
              CrossAxisAlignment.start,
            ),
            titleAnddetail(
              'Market Cap Rank',
              '₹${currentCrypto.marketCapRank!}',
              CrossAxisAlignment.end,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            titleAnddetail(
              'Low 24h',
              '₹${currentCrypto.low24H!}',
              CrossAxisAlignment.start,
            ),
            titleAnddetail(
              'High 24h',
              '₹${currentCrypto.high24H!}',
              CrossAxisAlignment.end,
            ),
          ],
        ),
        const SizedBox(height: 20),
        titleAnddetail(
          'Circulating Supply',
          '₹${currentCrypto.circulatingSupply!}',
          CrossAxisAlignment.start,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            titleAnddetail(
              'All Time Low',
              '₹${currentCrypto.atl!}',
              CrossAxisAlignment.start,
            ),
            titleAnddetail(
              'All Time High',
              '₹${currentCrypto.ath!}',
              CrossAxisAlignment.end,
            ),
          ],
        ),
      ],
    ),
  );
}
