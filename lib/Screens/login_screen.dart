import 'package:feldy/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final LoginData loginData = LoginData(email: "", password: "");

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 35, bottom: 30),
                width: 180.0,
                height: 180.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/feeldy.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: const Column(
                  children: [
                    Text(
                      'Feeldy',
                      style: TextStyle(
                          fontSize: 28.0,
                          color: Color(0xFFcb6ce6),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Senta. A melodia!',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black45,
                          fontFamily: 'Poppins'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    emailField(),
                    const SizedBox(height: 20),
                    passwordField(),
                    const SizedBox(height: 40),
                    enterButton(context),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      validator: (String? value) {},
      onSaved: (String? value) {
        loginData.email = value ?? "";
      },
      decoration: const InputDecoration(
          labelText: 'Email',
          icon: Icon(Icons.email),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFcb6ce6), width: 2),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.black12)),
          filled: true,
          fillColor: Colors.white),
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.text,
      validator: (String? value) {},
      onSaved: (String? value) {
        loginData.password = value ?? "";
      },
      decoration: const InputDecoration(
        labelText: 'Senha',
        icon: Icon(Icons.lock),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFcb6ce6), width: 2),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.black12)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  Widget enterButton(BuildContext buildContext) {
    Widget buttonChild = const Text(
      'Entrar',
      style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
    );

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            if (!loginData.validForm(loginData)) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text(
                  'Formulário de Login Inválido!',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
                action: SnackBarAction(
                  label: 'Fechar',
                  onPressed: () {},
                ),
              ));
            } else {
              //
            }
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 60),
            backgroundColor: const Color(0xFFcb6ce6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
          child: buttonChild),
    );
  }
}
