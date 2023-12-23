import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:proyecto_final/di/app_modules.dart';
import 'package:proyecto_final/model/resource_state.dart';
import 'package:proyecto_final/presentation/view/user/viewmodel/user_view_model.dart';
import 'package:proyecto_final/widget/alert/alert_view.dart';
import 'package:proyecto_final/widget/error/eror_view.dart';
import 'package:proyecto_final/widget/loading/loading_view.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({super.key});

  @override
  State<UserLoginPage> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  // magia de las DI
  final UserViewModel _userViewModel = inject<UserViewModel>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // escuchamos el stream
    _userViewModel.getUserState.stream.listen((event) {
      switch (event.status) {
        case Status.LOADING:
          LoadingView.show(context);
          setState(() {});
          break;
        case Status.SUCCESS:
          LoadingView.hide();
          // _token = event.data!;
          AlertView.show(context, "Sesión iniciada!");
          setState(() {});
          break;
        case Status.ERROR:
          LoadingView.hide();
          ErrorView.show(context, event.error!.toString(), () {
            log("error");
          });
          setState(() {});
          break;
        default:
      }
    });
  }

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
                      // TODO: hacer lo de mostrar - ocultar contraseña
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
                            _userViewModel.getUserToken();
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
