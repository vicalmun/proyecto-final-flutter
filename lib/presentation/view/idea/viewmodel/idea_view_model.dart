import 'dart:async';

import 'package:proyecto_final/domain/idea_repository.dart';
import 'package:proyecto_final/model/idea/idea.dart';
import 'package:proyecto_final/model/resource_state.dart';

class IdeaViewModel {
  final IdeaRepository _ideaRepository;

  // esta idea es la que se mete en data del Rs
  final StreamController<ResourceState<Idea>> getIdeaState = StreamController();

  IdeaViewModel({required IdeaRepository ideaRepository})
      : _ideaRepository = ideaRepository;

  getIdea() async {
    getIdeaState.add(ResourceState.loading());

    _ideaRepository.getIdea().then((value) {
      getIdeaState.add(ResourceState.success(value)); // Idea
    }).catchError((error) {
      getIdeaState.add(ResourceState.error(error));
    });
  }

  getIdeaDetail(Idea idea) async {
    getIdeaState.add(ResourceState.loading());

    _ideaRepository.getIdeaDetail(idea).then((value) {
      getIdeaState.add(ResourceState.success(value)); // Idea
    }).catchError((error) {
      getIdeaState.add(ResourceState.error(error));
    });
  }

  saveIdea(Idea idea) async {
    if (idea.isFavorite) {
      deleteIdea(idea);
      return;
    }
    idea.isFavorite = true;
    _ideaRepository.saveIdea(idea);
  }

  Future<List<Idea>> getIdeas() async {
    return await _ideaRepository.getIdeas();
  }

  deleteIdea(Idea idea) async {
    idea.isFavorite = false;
    await _ideaRepository.deleteIdea(idea);
  }

  // ideaIsPaused(Idea idea) async {
  //   getIdeaState.add(ResourceState.pause());
  // }

  bool isIdeaSaved(Idea idea) {
    return idea.isFavorite;
  }

  updateIdea(Idea idea) async {
    await _ideaRepository.updateIdea(idea);
  }

  void dispose() {
    getIdeaState.close();
  }
}
