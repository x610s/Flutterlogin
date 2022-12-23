import 'package:fh_login/widgets/formulario.dart';
import 'package:flutter/material.dart';

class CardWrapper extends StatelessWidget {
  const CardWrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(blurRadius: 5, color: Color.fromARGB(255, 94, 93, 93))
          ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:  Column(children: const[
                 Text(
                'Login',
                style: TextStyle(color: Colors.deepPurple, fontSize: 30),
              ),
                 SizedBox(
                height: 25,
              ),
               LoginForm(),
            ]),
          )),
    );
  }
}