import 'dart:js_interop';

import 'package:flutter/material.dart';

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
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'O Nome não pode ser vazio';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        widget.login = newValue!;
                      },
                      decoration: const InputDecoration(
                        labelText: "Nome",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'O Login não pode ser vazio';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        widget.login = newValue!;
                      },
                      decoration: const InputDecoration(
                        labelText: "Login",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10,),
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
                    const SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        const Text("Data de Nascimento: "),
                        Text(
                          widget.selectedDate != null
                              ? "${widget.selectedDate.toLocal()}".split(' ')[0]
                              : 'Selecione a data de nascimento',
                        ),
                        IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () => _selectDate(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () { },
                child: const Text("Cadastre-se"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
