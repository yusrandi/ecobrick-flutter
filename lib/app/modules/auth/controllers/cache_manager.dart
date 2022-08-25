import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  Future<bool> saveToken(String? token, int? roleId) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.TOKEN.toString(), token);
    await box.write(CacheManagerKey.ROLE.toString(), roleId);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.TOKEN.toString());
  }

  int? getRole() {
    final box = GetStorage();
    return box.read(CacheManagerKey.ROLE.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.TOKEN.toString());
    await box.remove(CacheManagerKey.ROLE.toString());
  }
}

enum CacheManagerKey { TOKEN, ROLE }
