import 'package:fh_login/provider/login_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    var loginForm = Provider.of<LoginProvider>(context);
    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(children: [
        /* Correo */
        TextFormField(
          autocorrect: false,
          initialValue: loginForm.email,
          validator: loginForm.ValidateEmail,
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) => loginForm.email = value,
          decoration: const InputDecoration(
              hintText: 'Ingresa tu correo',
              prefixIcon: Icon(Icons.alternate_email)),
        ),
        /* Fin Crreo */

        const SizedBox(
          height: 30,
        ),

        /* Password */
        TextFormField(
          obscureText: true,
          autocorrect: false,
          initialValue: loginForm.password,
          onChanged: (value) => loginForm.password = value,
          validator: (value) {
            if (value != null && value.length < 6) {
              return 'Clave muy corta';
            }
            return null;
          },
          decoration: const InputDecoration(
              hintText: 'Ingrese su contraseña', prefixIcon: Icon(Icons.lock)),
        ),
        /*  Fin Password */

        const SizedBox(
          height: 30,
        ),
        TextButton(
            style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(5),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                fixedSize: const MaterialStatePropertyAll(Size(250, 48)),
                backgroundColor: MaterialStateProperty.all(
                    loginForm.isLoading ? Colors.grey : Colors.deepPurple)),
            onPressed: loginForm.isLoading
                ? null
                : () async {
                    if (!loginForm.formKey.currentState!.validate()) {
                      return;
                    }
                   loginForm.isLoading = true; 
                   String? token = await loginForm.Login();
                   loginForm.isLoading = false; 
                   if(token!=null && context.mounted){
                    Navigator.pushReplacementNamed(context,'home');
                   }
                  },
            child: Text(loginForm.isLoading ? 'Cargando' : 'Listo',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400)))
      ]),
    );
  }
}
