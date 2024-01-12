import 'package:proyecto_final/data/user/local/user_local_data_source.dart';
import 'package:proyecto_final/data/user/remote/model/user_response.dart';
import 'package:proyecto_final/data/user/remote/user_remote_data_source.dart';
import 'package:proyecto_final/domain/user_repository.dart';

class UserDataImpl extends UserRepository {
  final UserRemoteImpl _userRemoteImpl;
  final UserLocalImpl _userLocalImpl;

  UserDataImpl(
      {required UserRemoteImpl userRemoteImpl,
      required UserLocalImpl userLocalImpl})
      : _userRemoteImpl = userRemoteImpl,
        _userLocalImpl = userLocalImpl;

  @override
  getToken() async {
    UserResponse userResponse = await _userRemoteImpl.getUser();
    await _userLocalImpl.saveTokenInStorage(userResponse.token);
  }

  @override
  Future<String> getTokenFromStorage() async {
    try {
      String token = await _userLocalImpl.getToken();
      return token;
    } catch (e) {
      throw Exception('Failed to load token');
    }
  }

  @override
  deleteTokemFromStorage() async {
    await _userLocalImpl.deleteTokemFromStorage();
  }
}
