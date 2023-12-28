import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class IdeaLocalImpl {
  final storage = const FlutterSecureStorage();

  Future<String> getToken() async {
    final token = await storage.read(key: "token");
    if (token != null) {
      return token;
    } else {
      throw Exception('Failed to load token');
    }
  }
}
