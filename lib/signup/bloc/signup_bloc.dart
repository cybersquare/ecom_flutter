import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csecom/signup/signup.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>(
      (event, emit) async {
        if (event is SaveUserDetailsEvent) {
          try {
            // ignore: omit_local_variable_types

            // ignore: omit_local_variable_types
            final UserCredential userdetials =
                await _auth.createUserWithEmailAndPassword(
              email: event.email,
              password: event.password,
            );
            // print('registeration successfull');
            // print(userdetials.user?.uid);
            await users.doc(userdetials.user?.uid).set({
              'full_name': event.name, // John Doe
              'address': event.address, // Stokes and Sons
              'email': event.email,
              'userid': userdetials.user?.uid, // 42
            });
            // await FlutterSession().set("isAuth", isAuth);
            final prefs = await SharedPreferences.getInstance();
            print("test");
            await prefs.setString('userid', userdetials.user!.uid);
            print("test1");
            print(prefs.getString('userid'));
            // print(us);
            emit(NavigateToLogin());
          } on FirebaseAuthException catch (e) {
            if (e.code == 'email-already-in-use') {
              emit(SignUpFailed(emailUseError: true));
            } else {
              emit(SignUpFailed(emailUseError: false));
            }
          } catch (e) {
            emit(SignUpFailed(emailUseError: false));
          }
        }
      },
    );
  }
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final FirebaseAuth _auth = FirebaseAuth.instance;
}
