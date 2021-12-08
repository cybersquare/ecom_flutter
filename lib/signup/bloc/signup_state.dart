part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignUpFailed extends SignupState {
  SignUpFailed({required this.emailUseError});
  bool emailUseError;
}

class NavigateToLogin extends SignupState {}
