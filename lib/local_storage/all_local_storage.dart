import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  // save theme in local storage.....
  static Future<bool> saveTheme(String theme) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool result = await sharedPreferences.setString('theme', theme);
    return result;
  }
  // get save theme ....

  static Future<String?> getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? currentTheme = sharedPreferences.getString('theme');
    return currentTheme;
  }

  // local storage for favorite Crypto coin....
  static Future<bool> addFavorite(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    List<String> favorite = sharedPreferences.getStringList('favorite') ?? [];
    favorite.add(id);
    return await sharedPreferences.setStringList('favorite', favorite);
  }

  static Future<bool> removeFavorite(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    List<String> favorite = sharedPreferences.getStringList('favorite') ?? [];
    favorite.remove(id);
    return await sharedPreferences.setStringList('favorite', favorite);
  }

  static Future<List<String>> fetchFavorite() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList('favorite') ?? [];
  }
}
