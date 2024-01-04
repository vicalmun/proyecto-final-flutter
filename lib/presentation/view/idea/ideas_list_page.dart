import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_final/di/app_modules.dart';
import 'package:proyecto_final/model/idea/idea.dart';
import 'package:proyecto_final/presentation/navigation/navigation_routes.dart';
import 'package:proyecto_final/presentation/view/idea/viewmodel/idea_view_model.dart';

class IdeasListPage extends StatefulWidget {
  const IdeasListPage({super.key});

  @override
  State<IdeasListPage> createState() => _IdeasListPageState();
}

class _IdeasListPageState extends State<IdeasListPage> {
  final IdeaViewModel _ideaViewModel = inject<IdeaViewModel>();
  List<Idea> ideasList = [];

  @override
  void initState() {
    super.initState();
    _ideaViewModel.getIdeas().then((value) {
      ideasList = value;
      setState(() {});
    });
  }

  void updateList(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final Idea item = ideasList.removeAt(oldIndex);
      ideasList.insert(newIndex, item);

      // todo: debería updatearla también en shapref
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ideas'),
      ),
      body: SafeArea(
        child: SizedBox(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ReorderableListView.builder(
              onReorder: updateList,
              itemCount: ideasList.length,
              itemBuilder: (context, index) {
                final Idea idea = ideasList[index];
                return GestureDetector(
                    key: Key('$index'),
                    child: ExpansionTile(
                        collapsedShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        collapsedBackgroundColor: Colors.green.shade200,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.green.shade100,
                        // key: Key('$index'),
                        title: Text(idea.title,
                            style: const TextStyle(fontSize: 20)),
                        children: [
                          Text(idea.description ?? ''),
                        ]),
                    onDoubleTap: () {
                      context.go(
                        NavigationRoutes.IDEA_DETAIL_ROUTE,
                        extra: idea,
                      );
                    });
              }),
        )),
      ),
    );
  }
}
