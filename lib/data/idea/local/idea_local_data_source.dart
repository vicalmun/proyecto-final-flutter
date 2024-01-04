import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:proyecto_final/model/idea/idea.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IdeaLocalImpl {
  final storage = const FlutterSecureStorage();

  Future<String> getToken() async {
    final token = await storage.read(key: "token");
    if (token != null) {
      return token;
    } else {
      throw Exception('Failed to load token');
    }
  }

  Future<List<Idea>> getIdeas() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // lista de ideas en formato json
    String ideasString = prefs.getString('ideas') ?? '[]';

    List<dynamic> ideasJson = json.decode(ideasString);
    List<Idea> ideasList =
        ideasJson.map((idea) => Idea.fromJson(idea)).toList();

    return ideasList;
  }

  Future<void> saveIdea(Idea idea) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Idea> ideasList = await getIdeas();
    ideasList.add(idea);

    String ideasJson =
        json.encode(ideasList.map((idea) => idea.toJson()).toList());
    print(ideasJson);
    await prefs.setString('ideas', ideasJson);
  }

  Future<void> deleteIdea(Idea idea) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Idea> ideasList = await getIdeas();
    ideasList.removeWhere((ideaInList) => ideaInList.id == idea.id);
    String ideasJson =
        json.encode(ideasList.map((idea) => idea.toJson()).toList());
    await prefs.setString('ideas', ideasJson);
  }

  List<Idea> parseIdeas(String jsonStr) {
    var list = jsonDecode(jsonStr) as List<dynamic>;
    List<Idea> ideas = list.map((item) => Idea.fromJson(item)).toList();
    return ideas;
  }

  // todo: update idea, si es favorite se puede actualizar (sería añadir descripción y categorías)
  // pero se le pasa la idea nueva y se sustituye en la lista de ideas
}
