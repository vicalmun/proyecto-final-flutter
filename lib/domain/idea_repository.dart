import 'package:proyecto_final/model/idea/idea.dart';

abstract class IdeaRepository {
  Future<Idea> getIdea();
}
