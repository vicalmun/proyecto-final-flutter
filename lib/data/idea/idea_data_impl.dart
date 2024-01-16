import 'package:proyecto_final/data/idea/local/idea_local_data_source.dart';
import 'package:proyecto_final/data/idea/remote/idea_remote_data_source.dart';
import 'package:proyecto_final/data/idea/remote/mapper/idea_remote_local_mapper.dart';
import 'package:proyecto_final/data/idea/remote/model/idea_response.dart';
import 'package:proyecto_final/domain/idea_repository.dart';
import 'package:proyecto_final/model/idea/idea.dart';

class IdeaDataImpl extends IdeaRepository {
  final IdeaRemoteImpl _ideaRemoteImpl;
  final IdeaLocalImpl _ideaLocalImpl;

  IdeaDataImpl(
      {required IdeaRemoteImpl ideaRemoteImpl,
      required IdeaLocalImpl ideaLocalImpl})
      : _ideaRemoteImpl = ideaRemoteImpl,
        _ideaLocalImpl = ideaLocalImpl;

  @override
  Future<Idea> getIdea() async {
    final token = await _ideaLocalImpl.getToken();
    IdeaResponse ideaResponse = await _ideaRemoteImpl.getIdea(token);
    return IdeaMapper.fromRemote(ideaResponse);
  }

  @override
  Future<Idea> getIdeaDetail(Idea idea) async {
    Idea idea0 = idea;
    final token = await _ideaLocalImpl.getToken();
    IdeaResponse ideaResponse =
        await _ideaRemoteImpl.getIdeaDetail(token, idea);
    idea0.description = ideaResponse.message.content;
    return idea0;
  }

  @override
  Future<void> saveIdea(Idea idea) async {
    await _ideaLocalImpl.saveIdea(idea);
  }

  @override
  Future<List<Idea>> getIdeas() async {
    return await _ideaLocalImpl.getIdeas();
  }

  @override
  Future<void> deleteIdea(Idea idea) async {
    await _ideaLocalImpl.deleteIdea(idea);
  }

  @override
  Future<void> updateIdea(Idea idea) async {
    await _ideaLocalImpl.updateIdea(idea);
  }
}
