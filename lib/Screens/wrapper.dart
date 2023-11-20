import 'package:feldy/Screens/Feed.dart';
import 'package:feldy/Screens/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_screen.dart';
import '../bloc/auth_bloc.dart';
import 'register_screen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WrapperState();
  }
}

class WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Erro do Firebase"),
                  content: Text(state.message),
                );
              });
        }
      },
      builder: (context, state) {
        if (state is Authenticated) {
          return authenticatedWidget(context);
        } else {
          return unauthenticatedWidget(context);
        }
      },
    );
  }
}

Widget authenticatedWidget(BuildContext context) {
  return const DefaultTabController(
    length: 2,
    child: Feed(),
  );
}

Widget unauthenticatedWidget(BuildContext context) {
  return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
          children: [const LoginScreen(), Register()],
        ),
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text("Autenticação Necessária",
              style: TextStyle(fontFamily: 'Poppins')),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Efetuar Login',
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
              ),
              Tab(
                child: Text(
                  'Novo Cadastro',
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
              )
            ],
          ),
        ),
      ));
}
