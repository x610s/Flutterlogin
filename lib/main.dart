import 'dart:io';
import 'package:fh_login/provider/login_form_provider.dart';
import 'package:fh_login/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future main() async {
  await dotenv.load(fileName: ".env");
  HttpOverrides.global = MyHttpOverrides();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
          ChangeNotifierProvider(create: (_)=> LoginProvider(), lazy: false, ),
    ],child: const MyApp(),);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'loading',
      routes: {
        'home': (_) => const HomeScreen(),
        'login': (_) => const LoginScreen(),
        'loading': (_)=> const LoadingScreen()
      },
      theme: ThemeData.light().copyWith(
          inputDecorationTheme: const InputDecorationTheme(
        prefixIconColor: Colors.indigo,
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.deepPurple)),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      )),
    );
  }
}
