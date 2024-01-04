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
    getIdeas();
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
          child: ListView.builder(
              itemCount: ideasList.length,
              itemBuilder: (context, index) {
                final Idea idea = ideasList[index];
                return Dismissible(
                  key: Key(idea.id.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      _ideaViewModel.deleteIdea(idea);
                      ideasList.removeAt(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Idea eliminada')),
                      );
                    });
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: GestureDetector(
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
                      }),
                );
              }),
        )),
      ),
    );
  }

  getIdeas() async {
    _ideaViewModel.getIdeas().then((value) {
      ideasList = value;
      setState(() {});
    });
  }
}
