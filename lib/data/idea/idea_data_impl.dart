import 'package:proyecto_final/data/idea/remote/idea_remote_data_source.dart';
import 'package:proyecto_final/data/idea/remote/mapper/idea_remote_local_mapper.dart';
import 'package:proyecto_final/data/idea/remote/model/idea_response.dart';
import 'package:proyecto_final/domain/idea_repository.dart';
import 'package:proyecto_final/model/idea/idea.dart';

class IdeaDataImpl extends IdeaRepository {
  final IdeaRemoteImpl _ideaRemoteImpl;

  IdeaDataImpl({required IdeaRemoteImpl ideaRemoteImpl})
      : _ideaRemoteImpl = ideaRemoteImpl;

  @override
  Future<Idea> getIdea() async {
    IdeaResponse ideaResponse = await _ideaRemoteImpl.getIdea();
    return IdeaMapper.fromRemote(ideaResponse);
  }

  // TODO: falta hacer el guardar la idea en las shared preferences
  // definir la func en el repo e implementarla en el data impl local

  // TODO: recuperar la lista de ideas guardadas en las shared preferences al iniciar la app
  // definir la func en el repo e implementarla en el data impl local
}
