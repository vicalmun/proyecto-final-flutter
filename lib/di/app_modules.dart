import 'package:get_it/get_it.dart';
import 'package:proyecto_final/data/idea/idea_data_impl.dart';
import 'package:proyecto_final/data/idea/remote/idea_remote_data_source.dart';
import 'package:proyecto_final/data/user/local/user_local_data_source.dart';
import 'package:proyecto_final/data/user/remote/user_remote_data_source.dart';
import 'package:proyecto_final/data/user/user_data_impl.dart';

GetIt inject = GetIt.instance;

class AppModules {
  void setup() {
    _setupIdeaModule();
    _setupUserModule();
  }

  _setupIdeaModule() {
    inject.registerFactory(() => IdeaRemoteImpl());
    inject.registerFactory(() => IdeaDataImpl(ideaRemoteImpl: inject.get()));
  }

  _setupUserModule() {
    inject.registerFactory(() => UserRemoteImpl());
    inject.registerFactory(() => UserLocalImpl());
    inject.registerFactory(() => UserDataImpl(
        userRemoteImpl: inject.get(), userLocalImpl: inject.get()));
  }
}
