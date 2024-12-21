import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const String _key = 'superhero_count';

  Future<void> saveSuperHeroCount(int count) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key, count);
  }

  Future<int> getSuperHeroCount() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_key) ?? 0;
  }
}