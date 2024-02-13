import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';

class LocalStorageKeys {
  static const accessToken = "AccessToken";
  static const refreshToken = "RefreshToken";
}

@injectable
class LocalStorageService {
  final _box = GetStorage();

  static Future<void> init() {
    return GetStorage.init();
  }

  String? read(String key) {
    return _box.read(key);
  }

  Future<void> write(String key, dynamic value) {
    return _box.write(key, value);
  }

  Future<void> clear(String key) {
    return _box.remove(key);
  }

  bool isEmpty(String key) {
    return _box.read(key) == null;
  }

  bool isNotEmpty(String key) {
    return _box.read(key) != null;
  }
}
