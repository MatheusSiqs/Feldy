import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();
    String username = "";
    String password = "";
    return Center(
      child: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              height: 250,
              child: Column(
                children: [
                  TextFormField(
                    validator: (String? inValue) {
                      if (inValue!.isEmpty) {
                        return "Insira algo como username";
                      }
                      return null;
                    },
                    onSaved: (String? inValue) {
                      username = inValue!;
                    },
                    decoration: const InputDecoration(
                        labelText: "Login",
                        border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    validator: (String? inValue) {
                      if (inValue!.length < 4) {
                        return "Tem que ter ao menos 4 caracters";
                      }
                      return null;
                    },
                    onSaved: (String? inValue) {
                      password = inValue!;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        // Lançando evento
                        BlocProvider.of<AuthBloc>(context)
                            .add(LoginUser(username: username, password: password));
                      }
                    },
                    child: const Text("Login"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}