import 'dart:async';

import 'package:flutter_login_bloc/src/blocs/validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _pincode = BehaviorSubject<String>();

  Stream<String> get email => _email.stream.transform(validateEmail);

  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<String> get pincode => _pincode.stream.transform(validatePincode);

  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (e, p) => true);

  Function(String) get changeEmail => _email.sink.add;

  Function(String) get changePassword => _password.sink.add;

  Function(String) get changePincode => _pincode.sink.add;

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;
    final validPincode = _pincode.value;

    print('Email is $validEmail');
    print('Password is $validPassword');
    print('Pincode is $pincode');
  }

  dispose() {
    _email.close();
    _password.close();
    _pincode.close();
  }
}
