import 'package:cryptocurrency_app/local_storage/all_local_storage.dart';
import 'package:cryptocurrency_app/pages/splash_screen.dart';
import 'package:cryptocurrency_app/provider/crypto_provider.dart';
import 'package:cryptocurrency_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String currentTheme = await LocalStorage.getTheme() ?? 'dark';
  runApp(MainApp(theme: currentTheme));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.theme});
  final String theme;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CryptoProvider>(
            create: (context) => CryptoProvider()),
        ChangeNotifierProvider<ThemeProvider>(
            create: (context) => ThemeProvider(theme))
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: ThemeData(
                primaryColor: Colors.white,
                brightness: Brightness.light,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    iconTheme: IconThemeData(
                      color: Colors.black,
                    ))),
            darkTheme: ThemeData(
              primaryColor: Colors.black.withOpacity(0.9),
              brightness: Brightness.dark,
              scaffoldBackgroundColor: const Color(0xff15161a),
              appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: Color(0xff15161a),
              ),
            ),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
