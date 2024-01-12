import 'package:flutter/material.dart';

abstract class AuthBlocEvent {}

class SignUpEvent extends AuthBlocEvent {
  final String name;
  final String email;
  final String pass;
  final GlobalKey<FormState> keyEmail;
  final GlobalKey<FormState> keypass;
  final GlobalKey<FormState> keyUser;

  SignUpEvent(this.name, this.email, this.pass, this.keyEmail, this.keypass,
      this.keyUser);
}
