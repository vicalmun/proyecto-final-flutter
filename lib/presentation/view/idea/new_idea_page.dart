import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_final/di/app_modules.dart';
import 'package:proyecto_final/model/idea/idea.dart';
import 'package:proyecto_final/model/resource_state.dart';
import 'package:proyecto_final/presentation/navigation/navigation_routes.dart';
import 'package:proyecto_final/presentation/view/idea/viewmodel/idea_view_model.dart';
import 'package:proyecto_final/widget/error/eror_view.dart';
import 'package:proyecto_final/widget/loading/loading_view.dart';

class NewIdeaPage extends StatefulWidget {
  const NewIdeaPage({super.key});

  @override
  State<NewIdeaPage> createState() => _NewIdeaPageState();
}

class _NewIdeaPageState extends State<NewIdeaPage> {
  final IdeaViewModel _ideaViewModel = inject<IdeaViewModel>();

  Idea? _idea;

  bool isLoged = false;

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
          LoadingView.hide();
          ErrorView.show(context, event.error.toString(), () {
            //
          });
          setState(() {});
          break;
      }
    });
  }

  @override
  void dispose() {
    _ideaViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generador de ideas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.go(NavigationRoutes.SETTINGS_ROUTE);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Text(
                    _idea?.title ?? "No se han generado ideas",
                    style: const TextStyle(fontSize: 24.0),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FilledButton(
                          style:
                              ButtonStyle(backgroundColor: activatedButton()),
                          onPressed: () async {
                            if (_idea == null) {
                              return;
                            }
                            context.go(NavigationRoutes.IDEA_DETAIL_FROM_HOME,
                                extra: _idea);
                          },
                          child: const Text('Saber más')),
                      FilledButton.icon(
                          style:
                              ButtonStyle(backgroundColor: activatedButton()),
                          onPressed: () {
                            if (_idea == null) {
                              return;
                            }
                            if (_ideaViewModel.isIdeaSaved(_idea!)) {
                              _ideaViewModel.deleteIdea(_idea!);
                              setState(() {});
                              return;
                            }
                            _ideaViewModel.saveIdea(_idea!);
                            setState(() {});
                          },
                          icon: _idea?.isFavorite ?? false
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_border),
                          label: _idea?.isFavorite ?? false
                              ? const Text("Guardada")
                              : const Text('Guardar'))
                    ],
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Nueva idea"),
        onPressed: getNewIdea(),
        backgroundColor: Colors.green.shade200,
      ),
      drawerEnableOpenDragGesture: false,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              // decoration: BoxDecoration(
              //   color: Colors.blue,
              // ),
              child: Text(''),
            ),
            ListTile(
              title: isLoged
                  ? const Text('Cerrar sesión')
                  : const Text('Iniciar sesión'),
              onTap: () {
                context.pop();
                context.go(NavigationRoutes.LOGIN_ROUTE);
              },
            ),
            ListTile(
              title: const Text('Lista de favoritos'),
              onTap: () {
                context.go(NavigationRoutes.IDEAS_LIST_ROUTE);
              },
            ),
          ],
        ),
      ),
    );
  }

  getNewIdea() {
    return () {
      _ideaViewModel.getIdea();
    };
  }

  MaterialStateProperty<Color> activatedButton() {
    MaterialStateProperty<Color> backgrounColor;

    backgrounColor = _idea == null
        ? MaterialStateProperty.all<Color>(Colors.grey)
        : MaterialStateProperty.all<Color>(Colors.deepPurple);

    return backgrounColor;
  }
}
