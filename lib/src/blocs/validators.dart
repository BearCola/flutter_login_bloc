import 'dart:async';

class Validators {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError('Enter a valid email');
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 3) {
      sink.add(password);
    } else {
      sink.addError('Password must be at least 4 characters');
    }
  });
  final validatePincode = StreamTransformer<String, String>.fromHandlers(
      handleData: (pincode, sink) {
    if (pincode.length > 5) {
      sink.add(pincode);
    } else {
      sink.addError('Pincode must be at least 6 characters');
    }
  });
}
