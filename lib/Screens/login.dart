import 'dart:js_interop';

import 'package:flutter/material.dart';

import 'feed.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  late String login;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.name,
                      validator: (text){
                        if (text == null || text.isNull){
                          return 'O Login não pode ser vazio';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        login = "$newValue";
                      },
                      decoration: const InputDecoration(
                        labelText: "Login",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isNull){
                          return 'Por favor insira a senha';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Password",
                        labelText: "Password",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20)
                ),
                onPressed: () => setState(() {
                  if(_formKey.currentState!.validate()){
                    _formKey.currentState!.save();
                  }
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=> const Feed())//const MyHomePage(title: "Feldy"))
                  );
                }), 
                child: const Text("Login")
              ),
            ],
          ),
        ),
      )
    );
  }
}