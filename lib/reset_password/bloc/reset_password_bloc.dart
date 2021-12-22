import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  FirebaseAuth auth = FirebaseAuth.instance;
  ResetPasswordBloc() : super(ResetPasswordInitial()) {
    on<ResetPasswordEvent>((event, emit) async {
      if (event is ResetpwdWithEmail) {
        try {
          var resetPassword =
              await auth.sendPasswordResetEmail(email: event.email);
          emit(ResetpwdSuccess());
        } catch (e) {
          emit(ResetpwdFailedState());
        }
      } else {
        emit(ResetpwdFailedState());
      }
    });
  }
}
