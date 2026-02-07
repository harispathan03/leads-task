import 'package:get_storage/get_storage.dart';

class LocalStorageKeys {
  static String isLoggedIn = 'isLoggedIn';
}

class LocalStorage {
  static GetStorage localStorage = GetStorage();

  static read({required String key}) {
    return localStorage.read(key);
  }

  static readAll({required List<String> list}) {
    return list.map((key) => localStorage.read(key));
  }

  static Future<void> write(
      {required String key, required dynamic data}) async {
    await localStorage.write(key, data);
  }

  static Future<void> writeAll({required Map<String, dynamic> map}) async {
    map.forEach((key, value) async {
      await localStorage.write(key, value);
    });
  }

  static Future<void> delete({required String key}) async {
    return await localStorage.remove(key);
  }

  static Future<void> deleteAll() async {
    return await localStorage.erase();
  }

  static getAllKeys() {
    return localStorage.getKeys();
  }
}
