import 'package:flutter/material.dart';
import 'package:proyecto_final/model/idea/idea.dart';

class IdeaDetailPage extends StatefulWidget {
  const IdeaDetailPage({super.key});

  @override
  State<IdeaDetailPage> createState() => _IdeaDetailPageState();
}

class _IdeaDetailPageState extends State<IdeaDetailPage> {
  Idea ideaEjemplo = Idea(
      title: "una idea",
      description: """
    La idea de negocio consiste en la venta de mobiliario reacondicionado. En lugar de comprar muebles nuevos, se adquieren muebles usados y se les realiza un proceso de restauración y renovación para dejarlos en óptimas condiciones. Estos muebles reacondicionados se ofrecen a un precio más accesible que los nuevos, lo que permite a los clientes ahorrar dinero en la compra de mobiliario para sus hogares, oficinas u otros espacios.\n\nEl negocio se encargaría de buscar y adquirir muebles usados en buen estado, que puedan ser restaurados y renovados. Luego, se realizaría un proceso de limpieza, reparación de posibles daños y renovación del acabado, para dejarlos como nuevos. Se podrían ofrecer diferentes estilos de mobiliario, desde clásico hasta moderno, para satisfacer los gustos y necesidades de los clientes.\n\nLa venta de estos muebles reacondicionados se realizaría a través de una tienda física y/o una tienda en línea, donde los clientes podrían ver las opciones disponibles y realizar sus compras. Además, se podría ofrecer servicios de entrega y montaje de los muebles, para brindar una experiencia completa y conveniente a los clientes.\n\nEste negocio tendría varias ventajas, como la posibilidad de ofrecer muebles de calidad a precios más accesibles, la contribución al cuidado del medio ambiente al darle una segunda vida a los muebles usados, y la oportunidad de satisfacer la demanda de personas que buscan opciones más económicas sin renunciar a la calidad y el estilo en sus muebles.\n\nEn resumen, la venta de mobiliario reacondicionado es una idea de negocio que busca ofrecer muebles de calidad a precios más accesibles, a través de la restauración y renovación de muebles usados.
""",
      categories: [Category.retail, Category.produccion],
      createdAt: DateTime.fromMicrosecondsSinceEpoch(1640979000000000));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ideaEjemplo.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(ideaEjemplo.description ?? ''),
                Text(ideaEjemplo.categories
                        ?.map((e) => e.toString())
                        .join(', ') ??
                    ''),
                Text(ideaEjemplo.createdAt.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
