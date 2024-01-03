import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_final/model/idea/idea.dart';
import 'package:proyecto_final/presentation/navigation/navigation_routes.dart';

class IdeasListPage extends StatefulWidget {
  const IdeasListPage({super.key});

  @override
  State<IdeasListPage> createState() => _IdeasListPageState();
}

class _IdeasListPageState extends State<IdeasListPage> {
  List<Idea> ideasList = [
    Idea(
      title: 'Compra-venta de obiliario reacondicionado',
      description: """
    La idea de negocio consiste en la venta de mobiliario reacondicionado. En lugar de comprar muebles nuevos, se adquieren muebles usados y se les realiza un proceso de restauración y renovación para dejarlos en óptimas condiciones. Estos muebles reacondicionados se ofrecen a un precio más accesible que los nuevos, lo que permite a los clientes ahorrar dinero en la compra de mobiliario para sus hogares, oficinas u otros espacios.\n\nEl negocio se encargaría de buscar y adquirir muebles usados en buen estado, que puedan ser restaurados y renovados. Luego, se realizaría un proceso de limpieza, reparación de posibles daños y renovación del acabado, para dejarlos como nuevos. Se podrían ofrecer diferentes estilos de mobiliario, desde clásico hasta moderno, para satisfacer los gustos y necesidades de los clientes.\n\nLa venta de estos muebles reacondicionados se realizaría a través de una tienda física y/o una tienda en línea, donde los clientes podrían ver las opciones disponibles y realizar sus compras. Además, se podría ofrecer servicios de entrega y montaje de los muebles, para brindar una experiencia completa y conveniente a los clientes.\n\nEste negocio tendría varias ventajas, como la posibilidad de ofrecer muebles de calidad a precios más accesibles, la contribución al cuidado del medio ambiente al darle una segunda vida a los muebles usados, y la oportunidad de satisfacer la demanda de personas que buscan opciones más económicas sin renunciar a la calidad y el estilo en sus muebles.\n\nEn resumen, la venta de mobiliario reacondicionado es una idea de negocio que busca ofrecer muebles de calidad a precios más accesibles, a través de la restauración y renovación de muebles usados.
""",
    ),
    Idea(
        title: 'Idea 1',
        description: 'Descripción de la idea 1',
        createdAt: DateTime.now()),
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
