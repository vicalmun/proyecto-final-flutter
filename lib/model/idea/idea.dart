import 'package:uuid/uuid.dart';

class Idea {
  String id;
  String title;
  String? description;
  bool isFavorite;
  List<Category>? categories;
  DateTime? createdAt;

  Idea({
    String? id,
    required this.title,
    this.description,
    bool? isFavorite,
    this.createdAt,
    this.categories,
  })  : id = id ?? const Uuid().v4(),
        isFavorite = isFavorite ?? false;

  factory Idea.fromJson(Map<String, dynamic> json) => Idea(
        id: json['id'] as String,
        title: json['title'] as String,
        description: json['description'] as String?,
        isFavorite: json['isFavorite'] as bool? ?? false,
        categories: (json['categories'] as List<dynamic>?)
            ?.map<Category>((e) => Category.values
                .firstWhere((element) => element.toString() == e))
            .toList(),
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'] as String)
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "isFavorite": isFavorite,
        "categories": categories,
        "createdAt": createdAt?.toIso8601String(),
      };
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
