import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csecom/signup/signup.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) async {
      if (event is SaveUserDetailsEvent) {
        try {
          // ignore: omit_local_variable_types
          await users.add({
            'full_name': event.name, // John Doe
            'address': event.address, // Stokes and Sons
            'email': event.email // 42
          });
          // ignore: omit_local_variable_types
          UserCredential userdetials =
              await _auth.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          print('registeration successfull');
          print(userdetials);
          emit(NavigateToLogin());
        } on FirebaseAuthException catch (e) {
          print(e.code);
          if (e.code == 'email-already-in-use') {
            print('The account already exists for that email.');
            emit(SignUpFailed(emailUseError: true));
          } else {
            emit(SignUpFailed(emailUseError: false));
          }
        } catch (e) {
          print(e);
          print("email-already-in-use");
          emit(SignUpFailed(emailUseError: false));
        }

        // .then((value) => print("User Added"))
        // .catchError(() => print("Failed to add user:"));

      }
    });
  }
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final FirebaseAuth _auth = FirebaseAuth.instance;
}
