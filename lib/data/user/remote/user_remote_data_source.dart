import 'package:dio/dio.dart';
import 'package:proyecto_final/data/user/remote/model/user_response.dart';

class UserRemoteImpl {
  final Dio dio = Dio();
  final name = "victor";
  final password = "alba";

  Future<UserResponse> getUser() async {
    final response = await dio.post(
      'https://vicalmun-openai-middleware-hiberus.onrender.com/login',
      data: {"username": name, "password": password},
    );
    if (response.statusCode == 200) {
      final userRemote = UserResponse.fromMap(response.data);
      return userRemote;
    } else {
      throw Exception('Failed to load user');
    }
  }
}
