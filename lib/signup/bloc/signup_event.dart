part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class SaveUserDetailsEvent extends SignupEvent {
  SaveUserDetailsEvent(
      {required this.name,
      required this.address,
      required this.email,
      required this.password});
  String name;
  String address;
  String email;
  String password;
}
