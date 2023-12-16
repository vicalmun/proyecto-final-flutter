import 'package:flutter/material.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({super.key});

  @override
  State<UserLoginPage> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final RegExp digitRegex = RegExp(r"^\d{*}$");

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Inicia sesión'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nombre',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Y si lo escribes??';
                        }
                        return null;
                      },
                    ), // Nombre
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      obscuringCharacter: 'ª',
                      decoration: const InputDecoration(
                          labelText: 'Contraseña',
                          suffix: Icon(Icons.remove_red_eye)),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Escribe una contraseña';
                        }
                        if (value.length < 8) {
                          return "El tamaño mínimo es de 8 caracteres";
                        }
                        return null;
                      },
                    ), // contraseña
                    const SizedBox(
                      height: 8,
                    ),
                    TextButton(
                        child: const Text("Enviar"),
                        onPressed: () {
                          // valida todo el formulario con su key
                          if (_formKey.currentState!.validate()) {
                            print("""
            Nombre: ${_nameController.text},
            pw: ${_passwordController.text},
            """);
                          } else {
                            // Mostrar un mensaje de error
                          }
                        }) // password
                  ],
                )),
          ),
        ));
  }
}
