import 'package:flutter/material.dart';
import 'package:login_bloc/src/login_sreen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login with bloc',
      home: Scaffold(
        body: LoginSreen(),
      ),
    );
  }
}