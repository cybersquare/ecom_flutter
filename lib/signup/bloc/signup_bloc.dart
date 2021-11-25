import 'package:csecom/signup/signup.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is SaveUserDetailsEvent) {
        try {
          UserCredential userdetials =
              await _auth.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          print("registeration successfull");
          print(userdetials);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            print('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            print('The account already exists for that email.');
          }
        } catch (e) {
          print(e);
        }
      }
    });
  }
}
