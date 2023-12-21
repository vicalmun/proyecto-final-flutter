import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_final/model/idea/idea.dart';
import 'package:proyecto_final/presentation/navigation/navigation_routes.dart';

class NewIdeaPage extends StatefulWidget {
  const NewIdeaPage({super.key});

  @override
  State<NewIdeaPage> createState() => _NewIdeaPageState();
}

class _NewIdeaPageState extends State<NewIdeaPage> {
  bool isLoged = false;
  Idea ideaMock = Idea(
    title: 'Servicio de entrega de comidas saludables a domicilio',
    description: 'Descripción de la idea 1',
    categories: [Category.tecnologia],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generador de ideas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              //
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
                    ideaMock.title,
                    style: const TextStyle(fontSize: 24.0),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FilledButton(
                          onPressed: () {
                            //
                          },
                          child: const Text('Saber más')),
                      FilledButton.icon(
                          onPressed: () {
                            //
                          },
                          icon: const Icon(Icons.favorite_border),
                          label: const Text('Guardar'))
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
        onPressed: () {
          //
        },
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
}
