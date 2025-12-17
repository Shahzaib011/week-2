import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  // Keys
  static const String tasksKey = "tasks";
  static const String waterKey = "water_count";

  // Save tasks
  static Future<void> saveTasks(List<String> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(tasksKey, tasks);
  }

  // Load tasks
  static Future<List<String>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(tasksKey) ?? [];
  }

  // Save water count
  static Future<void> saveWaterCount(int count) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(waterKey, count);
  }

  // Load water count
  static Future<int> loadWaterCount() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(waterKey) ?? 0;
  }
}
