import 'package:proyecto_final/data/user/local/user_local_data_source.dart';
import 'package:proyecto_final/data/user/remote/model/user_response.dart';
import 'package:proyecto_final/data/user/remote/user_remote_data_source.dart';

// TODO: debería extender del repo (definicion)
class UserDataImpl {
  final UserRemoteImpl _userRemoteImpl;
  final UserLocalImpl _userLocalImpl;

  UserDataImpl(
      {required UserRemoteImpl userRemoteImpl,
      required UserLocalImpl userLocalImpl})
      : _userRemoteImpl = userRemoteImpl,
        _userLocalImpl = userLocalImpl;

  void getToken() async {
    UserResponse userResponse = await _userRemoteImpl.getUser();
    await _userLocalImpl.saveTokenInStorage(userResponse.token);
  }
}
