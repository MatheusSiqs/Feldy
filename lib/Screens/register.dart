import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';

class Register extends StatefulWidget {
  late String login;
  late String selectedGender;
  late DateTime selectedDate = DateTime.now();

  Register({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RegisterState();
  }
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != widget.selectedDate) {
      setState(() {
        widget.selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();
    String username = "";
    String password = "";
    return Scaffold(
      backgroundColor: const Color(0xFF4157ff),
      body: Center(
        child: Form(
            key: formkey,
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 15),
                  width: 100.0,
                  height: 100.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/register.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const Text(
                  'Cadastro',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Por favor, preencha os campos abaixo',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white60,
                      fontFamily: 'Poppins'),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 40),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(children: [
                      emailField(),
                      const SizedBox(height: 15),
                      nameField(),
                      const SizedBox(height: 15),
                      passwordField(),
                      const SizedBox(height: 15),
                      confirmPasswordField(),
                      const SizedBox(height: 40),
                      Row(
                        children: [registerButton(context)],
                      )
                    ]),
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (String? value) {
        if (value != null) {
          if (value.isEmpty) {
            return "Insira um email válido";
          }
        }
        return null;
      },
      onSaved: (String? value) {
        // registerUserData.email = value ?? "";
      },
      decoration: const InputDecoration(
          labelText: 'Email',
          labelStyle: TextStyle(fontWeight: FontWeight.w600),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.black12)),
          filled: true,
          fillColor: Colors.white),
    );
  }

  Widget nameField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      validator: (String? value) {
        if (value != null) {
          if (value.isEmpty) {
            return "Insira um nome válido";
          }
        }
        return null;
      },
      onSaved: (String? value) {
        // registerUserData.name = value ?? "";
      },
      decoration: const InputDecoration(
          labelText: 'Nome',
          labelStyle:
              TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
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
      keyboardType: TextInputType.text,
      validator: (String? value) {
        if (value != null) {
          if (value.isEmpty) {
            return "Insira uma Senha";
          }

          // if (value != registerUserData.confirmPassword) {
          //   return "Senhas não coincidem";
          // }
        }
      },
      onChanged: (String? value) {
        setState(() {
          // registerUserData.password = value ?? "";
        });
      },
      onSaved: (String? value) {
        // registerUserData.password = value ?? "";
      },
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Senha',
        labelStyle:
            TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
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

  Widget confirmPasswordField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      validator: (String? value) {
        if (value != null) {
          if (value.isEmpty) {
            return "Insira uma Senha";
          }

          // if (value != registerUserData.password) {
          //   return "Senhas não coincidem";
          // }
        }
      },
      onChanged: (String? value) {
        setState(() {
          // registerUserData.confirmPassword = value ?? "";
        });
      },
      onSaved: (String? value) {
        // registerUserData.confirmPassword = value ?? "";
      },
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Confirme sua senha',
        labelStyle:
            TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
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

  Widget cancelButton() {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 60),
          backgroundColor: const Color(0xFFffffff),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
        child: const Text('Cancelar',
            style: TextStyle(color: Colors.black, fontSize: 16)),
      ),
    );
  }

  Widget registerButton(BuildContext buildContext) {
    Widget buttonChild = const Text(
      'Cadastrar',
      style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
    );

    // if (state is Loading) {
    //   if (state.load) {
    //     buttonChild = const CircularProgressIndicator();
    //   }
    // }

    return Expanded(
      child: ElevatedButton(
          onPressed: () {
            // if (formKey.currentState!.validate()) {
            //   formKey.currentState!.save();
            //   buildContext.read<AuthBloc>().add(SignUpRequested(
            //       registerUserData.email, registerUserData.password));
            // }
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 60),
            backgroundColor: const Color(0xFF4157ff),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
          child: buttonChild),
    );
  }
}
