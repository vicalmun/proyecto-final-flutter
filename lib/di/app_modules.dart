import 'package:get_it/get_it.dart';
import 'package:proyecto_final/data/idea/idea_data_impl.dart';
import 'package:proyecto_final/data/idea/remote/idea_remote_data_source.dart';
import 'package:proyecto_final/data/user/local/user_local_data_source.dart';
import 'package:proyecto_final/data/user/remote/user_remote_data_source.dart';
import 'package:proyecto_final/data/user/user_data_impl.dart';
import 'package:proyecto_final/domain/idea_repository.dart';
import 'package:proyecto_final/domain/user_repository.dart';
import 'package:proyecto_final/presentation/view/idea/viewmodel/idea_view_model.dart';
import 'package:proyecto_final/presentation/view/user/viewmodel/user_view_model.dart';

GetIt inject = GetIt.instance;

class AppModules {
  void setup() {
    _setupIdeaModule();
    _setupUserModule();
  }

  _setupIdeaModule() {
    inject.registerFactory(() => IdeaRemoteImpl());
    inject.registerFactory(() => IdeaDataImpl(ideaRemoteImpl: inject.get()));
    inject.registerFactory<IdeaRepository>(
        () => IdeaDataImpl(ideaRemoteImpl: inject.get()));
    inject.registerFactory(() => IdeaViewModel(ideaRepository: inject.get()));
  }

  _setupUserModule() {
    inject.registerFactory(() => UserRemoteImpl());
    inject.registerFactory(() => UserLocalImpl());
    inject.registerFactory<UserRepository>(() => UserDataImpl(
        userRemoteImpl: inject.get(), userLocalImpl: inject.get()));
    inject.registerFactory(() => UserViewModel(userRepository: inject.get()));
  }
}
