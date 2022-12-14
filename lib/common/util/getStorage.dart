// import 'package:shared_preferences/shared_preferences.dart';

// class Pref {
//   late SharedPreferences storage;

//   Future<void> init() async {
//     storage = await SharedPreferences.getInstance();
//   }

//   Future<void> writePref<T>(String key, T value) async {
//     if (value is String) {
//       storage.setString(key, value);
//     } else if (value is int) {
//       storage.setInt(key, value);
//     } else if (value is bool) {
//       storage.setBool(key, value);
//     } else if (value is double) {
//       storage.setDouble(key, value);
//     }
//   }

//   T readPref<T>(String key, T defaultValue) {
//     if (defaultValue is String) {
//       final String value = storage.getString(key) ?? defaultValue;
//       return value as T;
//     } else if (defaultValue is int) {
//       final int value = storage.getInt(key) ?? defaultValue;
//       return value as T;
//     } else if (defaultValue is bool) {
//       final bool value = storage.getBool(key) ?? defaultValue;
//       return value as T;
//     } else if (defaultValue is double) {
//       final double value = storage.getDouble(key) ?? defaultValue;
//       return value as T;
//     } else {
//       return defaultValue;
//     }
//   }
// }
