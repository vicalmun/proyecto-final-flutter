import 'package:uuid/uuid.dart';

class Idea {
  final id = const Uuid();
  String title;
  String? description;
  bool isFavorite = false;
  List<Category>? categories;
  DateTime? createdAt;

  Idea({
    required this.title,
    this.createdAt,
    this.isFavorite = false,
  });
}

enum Category {
  tecnologia,
  alimentacion,
  retail,
  servicios,
  salud,
  educacion,
  entretenimiento,
  construccion,
  produccion,
  transporte
}
