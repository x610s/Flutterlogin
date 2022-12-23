import 'package:fh_login/provider/login_form_provider.dart';
import 'package:fh_login/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var loginProvider = Provider.of<LoginProvider>(context, listen: false);
    return FutureBuilder(
      future: loginProvider.isLoged(),
      builder: (context, snapshot) {
        
        if (!snapshot.hasData) {
          return const Center(child: Text('Cargando'));
        }

        if (snapshot.data == true) {
          Future.microtask(() => {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        transitionDuration:const Duration(seconds: 0),
                        pageBuilder: (_, __, ___) {
                          return const HomeScreen();
                        }))
              });
        } else {
          Future.microtask(() => {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        transitionDuration: const Duration(seconds: 0),
                        pageBuilder: (_, __, ___) {
                          return const LoginScreen();
                        }))
              });
        }
        return Container();
      },
    );
  }
}
