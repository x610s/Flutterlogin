import 'package:fh_login/provider/login_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginProvider>(context, listen: false);
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          TextButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue)),
            onPressed: () async {
              await provider.PruebaAuth();
            },
            child: const Text(
              'Verificar auth!!!',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red)),
            onPressed: () async {
              await provider.Logout();
              if (context.mounted) {
                Navigator.pushReplacementNamed(context, 'login');
              }
            },
            child: const Text(
              'Salir',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      )),
    );
  }
}
