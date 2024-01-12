import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserLocalImpl {
  final storage = const FlutterSecureStorage();

  saveTokenInStorage(String token) async {
    await storage.write(key: "token", value: token);
  }

  Future<String> getToken() async {
    final token = await storage.read(key: "token");
    if (token != null) {
      return token;
    } else {
      throw Exception('Failed to load token');
    }
  }

  deleteTokemFromStorage() async {
    await storage.delete(key: "token");
  }
}
