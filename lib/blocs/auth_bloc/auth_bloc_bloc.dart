// ignore_for_file: unnecessary_null_comparison

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo/blocs/auth_bloc/auth_bloc_event.dart';
import 'package:todo/blocs/auth_bloc/auth_bloc_state.dart';
import 'package:todo/method/validtion.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBlocBloc() : super(AuthBlocInitial()) {
    on<SignUpEvent>((event, emit) async {
      try {
        List<bool> isValid = [];
        isValid.add(validtion(formKey: event.keyUser));
        isValid.add(validtion(formKey: event.keyEmail));
        isValid.add(validtion(formKey: event.keypass));
        if (!isValid.contains(false)) {
          final supabase = Supabase.instance.client;
          await supabase.auth
              .signUp(password: event.pass.trim(), email: event.email.trim());
          if (supabase.auth.currentSession!.accessToken == null) {
            emit(SignUpState());
          } else {
            emit(ErrorState('used'));
          }
        } else {
          emit(ErrorState('bb'));
        }
      } catch (e) {
        emit(ErrorState('sorry try later again'));
      }
    });
  }
}
