import 'package:cryptocurrency_app/model/chart_model.dart';
import 'package:cryptocurrency_app/model/currency_model.dart';
import 'package:cryptocurrency_app/pages/components/more_details.dart';
import 'package:cryptocurrency_app/provider/crypto_provider.dart';
import 'package:cryptocurrency_app/service/chart_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.currencyData});
  final currencyData;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  late TrackballBehavior trackballBehavior;
  late TabController tabController;
  List<ChartModel>? currencyData;

  getCrypto() {
    ChartApi().getCharts(widget.currencyData, days.toString()).then((onValue) {
      setState(() {
        currencyData = onValue as List<ChartModel>;
        // print(currencyData);
        // print(widget.currencyData);
      });
    });
  }

  @override
  void initState() {
    getCrypto();
    // getChart();
    trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
    );
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Page'),
        ),
        body: Container(
          // color: Colors.amber.shade100,
          child: Consumer<CryptoProvider>(
            builder: (context, cryptoProvider, child) {
              CurrencyModel currentCrypto =
                  cryptoProvider.fetchDatabyId(widget.currencyData);
              return RefreshIndicator(
                onRefresh: () async {
                  await cryptoProvider.fetchData();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    children: [
                      ListTile(
                        // Crypto Name by id...
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(currentCrypto.image!),
                        ),
                        title: Text(
                          '${currentCrypto.name!}(${currentCrypto.symbol!.toUpperCase()})',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          '₹ ${currentCrypto.currentPrice.toString()}',
                          style: const TextStyle(
                              color: Color(0xff0395eb),
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                        trailing: (currentCrypto.isFavorite == false)
                            ? GestureDetector(
                                onTap: () {
                                  cryptoProvider.addFavorite(currentCrypto);
                                },
                                child: const Icon(
                                  CupertinoIcons.heart,
                                  size: 22,
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  cryptoProvider.removeFavorite(currentCrypto);
                                },
                                child: const Icon(
                                  CupertinoIcons.heart_fill,
                                  color: Colors.red,
                                  size: 22,
                                ),
                              ),
                      ),
                      // Charts...
                      // Container(
                      //   color: Colors.amber,
                      //   height: 250,
                      //   width: double.infinity,
                      //   child: Text(days.toString()),
                      // ),
                      Container(
                          height: 280,
                          // color: Colors.yellow,
                          child: currencyData == null
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : SfCartesianChart(
                                  trackballBehavior: trackballBehavior,
                                  zoomPanBehavior: ZoomPanBehavior(
                                    enablePanning: true,
                                    zoomMode: ZoomMode.x,
                                  ),
                                  series: <CandleSeries>[
                                    CandleSeries<ChartModel, int>(
                                      enableSolidCandles: true,
                                      enableTooltip: true,
                                      bullColor: Colors.green,
                                      bearColor: Colors.red,
                                      dataSource: currencyData,
                                      xValueMapper: (ChartModel sales, _) =>
                                          sales.time,
                                      lowValueMapper: (ChartModel sales, _) =>
                                          sales.low,
                                      highValueMapper: (ChartModel sales, _) =>
                                          sales.high,
                                      openValueMapper: (ChartModel sales, _) =>
                                          sales.open,
                                      closeValueMapper: (ChartModel sales, _) =>
                                          sales.close,
                                      animationDuration: 55,
                                    ),
                                  ],
                                )),
                      const SizedBox(height: 8),
                      Container(
                        alignment: Alignment.center,
                        height: 30,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: ChartTime.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    ChartTimeBool = [
                                      false,
                                      false,
                                      false,
                                      false,
                                      false,
                                      false
                                    ];
                                    ChartTimeBool[index] = true;
                                    setDays(ChartTime[index]);
                                  });
                                  getCrypto();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2.5),
                                  decoration: BoxDecoration(
                                    color: ChartTimeBool[index] == true
                                        ? Colors.blue
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(ChartTime[index],
                                      style: const TextStyle(fontSize: 18)),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      TabBar(controller: tabController, tabs: const [
                        Tab(
                          child: Text(
                            'Details',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Tab(
                          child: Text('News', style: TextStyle(fontSize: 16)),
                        ),
                      ]),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 450,
                        child: TabBarView(controller: tabController, children: [
                          MoreDetails(currentCrypto),
                          Container(
                            color: Colors.blue,
                          ),
                          // MoreDetails(currentCrypto),
                        ]),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }

  List<String> ChartTime = ['D', 'W', 'M', '3M', '6M', 'Y'];
  List<bool> ChartTimeBool = [false, false, true, false, false, false];

  int days = 30;

  setDays(String txt) {
    if (txt == 'D') {
      setState(
        () {
          days = 1;
        },
      );
    }
    if (txt == 'W') {
      setState(
        () {
          days = 7;
        },
      );
    }
    if (txt == 'M') {
      setState(
        () {
          days = 30;
        },
      );
    }
    if (txt == '3M') {
      setState(
        () {
          days = 90;
        },
      );
    }
    if (txt == '6M') {
      setState(
        () {
          days = 180;
        },
      );
    }
    if (txt == 'Y') {
      setState(
        () {
          days = 365;
        },
      );
    }
  }

// Api for Crypto Chart.......
}
