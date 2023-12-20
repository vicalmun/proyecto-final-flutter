import 'package:uuid/uuid.dart';

class User {
  final id = const Uuid();
  String name;
  String password;
  String? token;

  User({required this.name, required this.password, this.token});
}
