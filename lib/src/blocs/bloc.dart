

import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:login_bloc/src/blocs/validator.dart';

class Bloc with Validator{
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  //Add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<bool> get submitValid=> Rx.combineLatest2(email, password, (a, b) => true);
  //Change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;


  submit (){
    final submitEmail = _email.value;
    final submitPassword = _password.value;

    print('$submitEmail && $submitPassword');
  }

  dispose(){
    _email.close();
    _password.close();
  }
}

final bloc = Bloc();