import 'package:dio/dio.dart';
import 'package:proyecto_final/data/idea/remote/model/idea_response.dart';
import 'package:proyecto_final/model/idea/idea.dart';

class IdeaRemoteImpl {
  final Dio dio = Dio();

  Future<IdeaResponse> getIdea(String token) async {
    final response = await dio.get(
        'https://vicalmun-openai-middleware-hiberus.onrender.com/api/new-idea',
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));

    if (response.statusCode == 200) {
      final IdeaResponse ideaResponse = IdeaResponse.fromMap(
          response.data); // maybe es mejor 'json.decode' que 'fromMap'?
      return ideaResponse;
    } else {
      throw Exception('Failed to generate new idea :(');
    }
  }

  Future<IdeaResponse> getIdeaDetail(String token, Idea idea) async {
    final response = await dio.get(
        'https://vicalmun-openai-middleware-hiberus.onrender.com/api/long-idea?idea=${parseToUri(idea.title)}',
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));

    if (response.statusCode == 200) {
      final IdeaResponse ideaResponse = IdeaResponse.fromMap(response.data);
      return ideaResponse;
    } else {
      throw Exception('Failed to load the information');
    }
  }

  String parseToUri(String text) {
    String parsedText = text.replaceAll(' ', '%20');
    print(parsedText);
    return parsedText;
  }
}
