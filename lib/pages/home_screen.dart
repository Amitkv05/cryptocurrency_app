import 'package:cryptocurrency_app/pages/components/currency_price.dart';
import 'package:cryptocurrency_app/pages/components/drawer.dart';
import 'package:cryptocurrency_app/pages/components/favorite.dart';
import 'package:cryptocurrency_app/pages/detail_page.dart';
import 'package:cryptocurrency_app/provider/crypto_provider.dart';
import 'package:cryptocurrency_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      drawer: drawer(context),
      body: Container(
        height: myHeight,
        width: myWidth,
        color: Colors.blue.shade700,
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //     colors: [
        //       Color.fromARGB(255, 255, 219, 73),
        //       Color(0xffFBC700),
        //     ],
        //   ),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                // left: myWidth * 0.03,
                right: myWidth * 0.03,
                top: myHeight * 0.001,
                bottom: myHeight * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: myHeight * 0.1,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                    ),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '      Stock Today...',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          themeProvider.toggleTheme();
                        });
                      },
                      icon: (themeProvider.themeMode == ThemeMode.light)
                          ? const Icon(
                              Icons.dark_mode,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.light_mode,
                              color: Colors.white,
                            )),
                ],
              ),
            ),
            // const Divider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: myWidth * 0.06),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$7,466.26',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CircleAvatar(
                    child: Icon(
                      Icons.account_balance_wallet_rounded,
                      size: 28,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: myWidth * 0.07),
              child: const Row(
                children: [
                  Text(
                    '+ 162% all Time',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: myHeight * 0.01),

            Expanded(
              child: Container(
                height: myHeight,
                width: myWidth,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    )),
                child: Column(
                  children: [
                    Container(
                      // color: Theme.of(context).primaryColor,
                      child: TabBar(
                        controller: tabController,
                        tabs: const [
                          Tab(
                            child: Text('Main Protfolio'),
                          ),
                          Tab(
                            child: Text('Top 10 Coins'),
                          ),
                          Tab(
                            child: Text('Favorite'),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: TabBarView(
                      controller: tabController,
                      children: [
                        main_protfolio(myWidth: myWidth, myHeight: myHeight),
                        top_10_list(myWidth: myWidth, myHeight: myHeight),
                        const Favorite(),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class top_10_list extends StatelessWidget {
  const top_10_list({
    super.key,
    required this.myWidth,
    required this.myHeight,
  });

  final double myWidth;
  final double myHeight;

  @override
  Widget build(BuildContext context) {
    return Consumer<CryptoProvider>(
      builder: (context, cryptoProvider, child) {
        return ListView.builder(
            // physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            // itemCount: 4,
            itemBuilder: (context, index) {
              final currencyCrypto = cryptoProvider.cryptoData[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => DetailPage(
                        currencyData: currencyCrypto.id!,
                      ));
                },
                child: ListTile(
                  leading:
                      CircleAvatar(child: Image.network(currencyCrypto.image!)),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currencyCrypto.name!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(currencyCrypto.symbol!.toUpperCase())
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
                        double priceChange24h = currencyCrypto.priceChange24H!;
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
            });
      },
    );
  }
}

class main_protfolio extends StatelessWidget {
  const main_protfolio({
    super.key,
    required this.myWidth,
    required this.myHeight,
  });

  final double myWidth;
  final double myHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: myWidth * 0.08, vertical: myHeight * 0.02),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Assets',
                style: TextStyle(fontSize: 20),
              ),
              Icon(Icons.add)
            ],
          ),
        ),
        Expanded(
            child: CurrencyPrice(
          theme: Theme.of(context).primaryColor,
        )),
      ],
    );
  }
}
