import 'package:flutter/material.dart';
import 'package:proyecto_final/di/app_modules.dart';
import 'package:proyecto_final/model/idea/idea.dart';
import 'package:proyecto_final/model/resource_state.dart';
import 'package:proyecto_final/presentation/view/idea/viewmodel/idea_view_model.dart';
import 'package:proyecto_final/widget/error/eror_view.dart';
import 'package:proyecto_final/widget/loading/loading_view.dart';

class IdeaDetailPage extends StatefulWidget {
  final Idea _idea;

  const IdeaDetailPage({super.key, required idea}) : _idea = idea;

  @override
  State<IdeaDetailPage> createState() => _IdeaDetailPageState();
}

class _IdeaDetailPageState extends State<IdeaDetailPage> {
  final IdeaViewModel _ideaViewModel = inject<IdeaViewModel>();

  // ignore: unused_field
  Idea? _idea;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _ideaViewModel.getIdeaState.stream.listen((event) {
      switch (event.status) {
        case Status.LOADING:
          LoadingView.show(context);
          setState(() {});
          break;
        case Status.SUCCESS:
          LoadingView.hide();
          _idea = event.data;
          setState(() {});
          break;
        case Status.ERROR:
          ErrorView.show(context, event.error.toString(), () {
            _ideaViewModel.getIdea();
          });
          LoadingView.hide();
          setState(() {});
          break;
      }
    });

    if (widget._idea.description == null) {
      _ideaViewModel.getIdeaDetail(widget._idea);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._idea.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(widget._idea.description ?? ''),
                Text(widget._idea.categories
                        ?.map((e) => e.toString())
                        .join(', ') ??
                    ''),
                Text(widget._idea.createdAt?.toString() ?? ''),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
