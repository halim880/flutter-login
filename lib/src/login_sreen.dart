import 'dart:js';

import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/bloc.dart';

class LoginSreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(),
          passwordField(),
          submitButton()
        ],
      ),
    );
  }

  Widget emailField(){

    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot){
        return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
            hintText: "email@gmail.com",
            labelText: 'Enter your email : ',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget passwordField(){
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot){
        return TextField(
            onChanged: bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
            hintText: "*******",
            labelText: 'Password : ',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }


  Widget submitButton(){
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot){
          return ElevatedButton(
            child: Text('Submit'),
            onPressed: snapshot.hasData ? bloc.submit : null,
          );
        }
    );
  }
}
