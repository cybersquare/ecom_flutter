part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class NavigateToHomeScreen extends LoginState {}

class LoginFailedState extends LoginState {}
