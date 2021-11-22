import 'package:bloc/bloc.dart';
import 'package:csecom/login/login.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  FirebaseAuth auth = FirebaseAuth.instance;
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginWithEmailAndPassword) {
        // print(event.email);
        // print(event.password);

        // UserCredential user = await auth.createUserWithEmailAndPassword(
        //   email: event.email,
        //   password: event.password,

        // );

        // print(user.user?.email);
        // print(user.user?.emailVerified);

        // auth
        //     .signInWithEmailAndPassword(
        //         email: event.email, password: event.password)
        //     .then((value) {
        //   print(value.user);
        // });
        var userdetails = await auth.signInWithEmailAndPassword(
            email: event.email, password: event.password);
        print(userdetails);
      }
    });
  }
}
