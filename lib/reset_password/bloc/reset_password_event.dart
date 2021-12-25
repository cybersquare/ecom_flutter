part of 'reset_password_bloc.dart';

abstract class ResetPasswordEvent {}

class ResetpwdWithEmail extends ResetPasswordEvent {
  ResetpwdWithEmail({required this.email}) {}
  String email;
}
