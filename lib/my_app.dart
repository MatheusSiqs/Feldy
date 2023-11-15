/*import 'package:feldy/Screens/feed.dart';
import 'package:feldy/auth/auth_repository.dart';
import 'package:feldy/login/login_view.dart';*/
// import 'package:feldy/profile/profile_view.dart';
//import 'package:feldy/Screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Screens/wrapper.dart';
import 'bloc/auth_bloc.dart';



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Feldy',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: MultiBlocProvider(providers: [
          BlocProvider(create: (context) => AuthBloc()),
        ], child: const Wrapper()));
  }
}