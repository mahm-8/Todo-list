
abstract class AuthBlocState {}

final class AuthBlocInitial extends AuthBlocState {}

final class SignUpState extends AuthBlocState {}

final class ErrorState extends AuthBlocState {
  final String msg;

  ErrorState(this.msg);
}
