import 'package:feldy/auth/auth_repository.dart';
import 'package:feldy/auth/form_submission_status.dart';
import 'package:feldy/login/login_bloc.dart';
import 'package:feldy/login/login_event.dart';
import 'package:feldy/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(
          authRepo: context.read<AuthRepository>(),
        ),
        child: _loginForm(),
      )
    );
  }

  Widget _loginForm(){
    return BlocListener<LoginBloc,LoginState>(
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus is SubmissionFailed){
          _showSnackBar(context, formStatus.exception.toString());
        }
      },
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _userField(),
              _passwordField(),
              _loginButton(),
            ],
          ),
        ),
      )
    );
  }

  Widget _userField(){
    return BlocBuilder<LoginBloc,LoginState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'User'
          ),
          validator: (value) => state.isValidUsername ? null : 'Username is Too Short',
          onChanged: (value) => context.read<LoginBloc>().add(
            LoginUsernameChanged(username: value) as LoginBloc,
          ),
        );  
      },
    );
  }

  Widget _passwordField(){
    return BlocBuilder<LoginBloc,LoginState>(
      builder: (context, state) {    
        return TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            icon: Icon(Icons.security),
            hintText: 'Password'
          ),
          validator: (value) => state.isValidPassword ? null: 'Password too short',
          onChanged: (value) => context.read<LoginBloc>().add(
            LoginPasswordChanged(password: value) as LoginBloc
          ),
        );
      }
    );
  }

  Widget _loginButton(){
    return BlocBuilder<LoginBloc,LoginState>(
      builder: (context, state) {    
        return state.formStatus is FormSubmitting 
        ? const CircularProgressIndicator() :
          ElevatedButton(
            onPressed: () {
              if(_formKey.currentState!.validate()){
                context.read<LoginBloc>().add(LoginSubmitted() as LoginBloc);
              }
            }, 
            child: const Text('Login')
          );
      }
    );
  }

  void _showSnackBar(BuildContext context, String message){
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}