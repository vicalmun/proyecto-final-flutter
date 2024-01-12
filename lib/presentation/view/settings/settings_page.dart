import 'package:flutter/material.dart';
import 'package:proyecto_final/di/app_modules.dart';
import 'package:proyecto_final/presentation/view/user/viewmodel/user_view_model.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? token;

  final UserViewModel _userViewModel = inject<UserViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }

  void getToken() async {
    token = await _userViewModel.getToken();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SafeArea(
        child: Column(
          children: [
            const Text('Settings'),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
              onPressed: () {
                _userViewModel.deleteToken();
                setState(() {
                  token = null;
                });
              },
              child: const Text('Borrar token'),
            ),
            Text((token != null) ? 'Hay token' : 'No hay token'),
          ],
        ),
      ),
    );
  }
}
