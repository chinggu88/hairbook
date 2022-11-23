import 'package:hair/common/util/ToastManager.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Pref pref = Pref._();

class Pref {
  Pref._();

  late SharedPreferences storage;

  Future<void> init() async {
    print('초기화');
    storage = await SharedPreferences.getInstance();
  }

  Future<void> writePref<T>(String key, T value) async {
    if (value is String) {
      storage.setString(key, value);
    } else if (value is int) {
      storage.setInt(key, value);
    } else if (value is bool) {
      storage.setBool(key, value);
    } else if (value is double) {
      storage.setDouble(key, value);
    } else {
      showNegativeToast('저장 가능한 타입이 아닙니다. ${T.runtimeType} ${T.toString()}');
    }
  }

  T readPref<T>(String key, T defaultValue) {
    if (defaultValue is String) {
      final String value = storage.getString(key) ?? defaultValue;
      return value as T;
    } else if (defaultValue is int) {
      final int value = storage.getInt(key) ?? defaultValue;
      return value as T;
    } else if (defaultValue is bool) {
      final bool value = storage.getBool(key) ?? defaultValue;
      return value as T;
    } else if (defaultValue is double) {
      final double value = storage.getDouble(key) ?? defaultValue;
      return value as T;
    } else {
      return defaultValue;
    }
  }
}
