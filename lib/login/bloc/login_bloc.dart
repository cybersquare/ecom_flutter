import 'package:bloc/bloc.dart';
import 'package:csecom/login/login.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  FirebaseAuth auth = FirebaseAuth.instance;
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginWithEmailAndPassword) {
        try {
          var userdetails = await auth.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          print(userdetails);
          if (userdetails == null) {
            print("LOGIN FAILED");
            emit(LoginFailedState());
          } else {
            emit(NavigateToHomeScreen());
          }
        } catch (e) {
          print('Login failed');
          print('Login faileddddddddddddd');
          emit(LoginFailedState());
        }
      }
    });
  }
}
