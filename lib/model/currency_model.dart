// ignore_for_file: public_member_api_docs, sort_constructors_first
class CurrencyModel {
  String? id;
  String? symbol;
  String? name;
  String? image;
  double? currentPrice;
  int? marketCap;
  int? marketCapRank;
  // int? fullyDilutedValuation;
  // int? totalVolume;
  double? high24H;
  double? low24H;
  double? priceChange24H;
  double? priceChangePercentage24H;
  // double? marketCapChange24H;
  // double? marketCapChangePercentage24H;
  double? circulatingSupply;
  // double? totalSupply;
  // double? maxSupply;
  double? ath;
  // double? athChangePercentage;
  // DateTime? athDate;
  double? atl;
  // double? atlChangePercentage;
  // DateTime? atlDate;
  // Roi? roi;
  DateTime? lastUpdated;
  SparklineIn7D? sparklineIn7D;
  bool isFavorite = false;
  CurrencyModel({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.marketCap,
    this.marketCapRank,
    // this.fullyDilutedValuation,
    // this.totalVolume,
    this.high24H,
    this.low24H,
    this.priceChange24H,
    this.priceChangePercentage24H,
    // this.marketCapChange24H,
    // this.marketCapChangePercentage24H,
    this.circulatingSupply,
    // this.totalSupply,
    // this.maxSupply,
    this.ath,
    // this.athChangePercentage,
    // this.athDate,
    this.atl,
    // this.atlChangePercentage,
    // this.atlDate,
    // this.roi,
    this.lastUpdated,
    this.sparklineIn7D,
  });
// using double.parse() for accepting tha double value also and to.String to not show any error for string value......
  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
      id: json["id"],
      symbol: json["symbol"],
      name: json["name"],
      image: json["image"],
      currentPrice: double.parse(json["current_price"].toString()),
      marketCap: json["market_cap"],
      marketCapRank: json["market_cap_rank"],
      high24H: double.parse(json["high_24h"].toString()),
      low24H: double.parse(json["low_24h"].toString()),
      priceChange24H: double.parse(json["price_change_24h"].toString()),
      priceChangePercentage24H:
          double.parse(json["price_change_percentage_24h"].toString()),
      circulatingSupply: double.parse(json["circulating_supply"].toString()),
      ath: double.parse(json["ath"].toString()),
      atl: double.parse(json["atl"].toString()),
      // atlDate:
      lastUpdated: json["last_updated"] == null
          ? null
          : DateTime.parse(json["last_updated"]),
      sparklineIn7D: json["sparkline_in_7d"] == null
          ? null
          : SparklineIn7D.fromJson(json["sparkline_in_7d"]));

  void addAll(List<CurrencyModel> cryptoData) {}
  // String toJson() => json.encode(toMap());

  // factory CurrencyModel.fromJson(String source) =>
  //     CurrencyModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

// class SparklineIn7D {
//   SparklineIn7D({
//     required this.price,
//   });
//   List<double> price;
//   factory SparklineIn7D.fromJson(Map<String, dynamic> json) => SparklineIn7D(
//       price: List<double>.from(json['price'].map((x) => x?.toDouble())));
//   Map<String, dynamic> toJson() => {
//         'price': List<dynamic>.from(price.map((x) => x)),
//       };
// }

class SparklineIn7D {
  List<double>? price;

  SparklineIn7D({
    this.price,
  });

  factory SparklineIn7D.fromJson(Map<String, dynamic> json) => SparklineIn7D(
        price: json["price"] == null
            ? []
            : List<double>.from(json["price"]!.map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "price": price == null ? [] : List<dynamic>.from(price!.map((x) => x)),
      };
}
