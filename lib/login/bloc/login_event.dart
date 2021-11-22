part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginWithEmailAndPassword extends LoginEvent {
  String email;
  String password;
  LoginWithEmailAndPassword({required this.email, required this.password}) {}
}
