import 'dart:async';

import 'package:proyecto_final/domain/user_repository.dart';
import 'package:proyecto_final/model/resource_state.dart';

class UserViewModel {
  final UserRepository _userRepository;

  // el ResourceState podría contener un string que indique el mensaje de éxito a la hora de obtener el token
  final StreamController<ResourceState> getUserState = StreamController();

  UserViewModel({required UserRepository userRepository})
      : _userRepository = userRepository;

  getUserToken() async {
    getUserState.add(ResourceState.loading());

    _userRepository.getToken().then((value) {
      getUserState.add(ResourceState.success("exito"));
    }).catchError((error) {
      getUserState.add(ResourceState.error(error));
    });
  }

  void dispose() {
    getUserState.close();
  }
}
