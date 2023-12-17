import 'package:flutter/material.dart';
import 'package:proyecto_final/model/idea/idea.dart';

class IdeasListPage extends StatefulWidget {
  const IdeasListPage({super.key});

  @override
  State<IdeasListPage> createState() => _IdeasListPageState();
}

class _IdeasListPageState extends State<IdeasListPage> {
  List<Idea> ideasList = [
    Idea(title: 'Idea 1', description: 'Descripción de la idea 1'),
    Idea(title: 'Idea 1', description: 'Descripción de la idea 1'),
    Idea(title: 'Idea 1', description: 'Descripción de la idea 1'),
    Idea(title: 'Idea 2', description: 'Descripción de la idea 2'),
    Idea(title: 'Idea 3', description: 'Descripción de la idea 3'),
    Idea(title: 'Idea 3', description: 'Descripción de la idea 3'),
    Idea(title: 'Idea 3', description: 'Descripción de la idea 3'),
  ];

  void updateList(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final Idea item = ideasList.removeAt(oldIndex);
      ideasList.insert(newIndex, item);
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
            // child: ReorderableListView.builder(
            //     onReorder: updateList,
            child: ListView.builder(
                itemCount: ideasList.length,
                itemBuilder: (context, index) {
                  final Idea idea = ideasList[index];
                  return ListTile(
                      key: Key(idea.id.toString()),
                      title: Text(idea.title),
                      subtitle: Text(idea.description ?? ''),
                      // trailing: const Icon(Icons.drag_handle),
                      onTap: () {
                        //
                      });
                })),
      ),
    );
  }
}
