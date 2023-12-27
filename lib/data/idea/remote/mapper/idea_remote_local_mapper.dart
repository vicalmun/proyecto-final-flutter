import 'package:proyecto_final/data/idea/remote/model/idea_response.dart';
import 'package:proyecto_final/model/idea/idea.dart';

class IdeaMapper {
  static Idea fromRemote(IdeaResponse remoteModel) {
    return Idea(
      title: remoteModel.message.content,
    );
  }
}
