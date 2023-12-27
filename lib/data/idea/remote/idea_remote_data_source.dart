import 'package:dio/dio.dart';
import 'package:proyecto_final/data/idea/remote/model/idea_response.dart';

class IdeaRemoteImpl {
  final Dio dio = Dio();

  Future<IdeaResponse> getIdea() async {
    final response = await dio.get(
        'https://vicalmun-openai-middleware-hiberus.onrender.com/api/new-idea');

    if (response.statusCode == 200) {
      final IdeaResponse ideaResponse = IdeaResponse.fromMap(
          response.data); // maybe es mejor 'json.decode' que 'fromMap'?
      return ideaResponse;
    } else {
      throw Exception('Failed to generate new idea :(');
    }
  }
}
