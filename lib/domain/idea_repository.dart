import 'package:proyecto_final/model/idea/idea.dart';

abstract class IdeaRepository {
  Future<Idea> getIdea();

  Future<Idea> getIdeaDetail(Idea idea);

  Future<void> saveIdea(Idea idea);

  Future<List<Idea>> getIdeas();

  Future<void> deleteIdea(Idea idea);
}
