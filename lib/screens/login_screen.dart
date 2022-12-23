import 'package:fh_login/widgets/auth_background.dart';
import 'package:fh_login/widgets/card_wrapper.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
      hijo: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(
            height: 150,
          ),
          CardWrapper(),
          TextButton(
              onPressed: null,
              child: Text(
                'Crear una nueva Cuenta',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ))
        ],
      )),
    ));
  }
}



