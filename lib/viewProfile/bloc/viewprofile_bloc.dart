import 'package:bloc/bloc.dart';
import 'package:csecom/viewProfile/viewprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'viewprofile_event.dart';
part 'viewprofile_state.dart';

class ViewprofileBloc extends Bloc<ViewprofileEvent, ViewprofileState> {
  ViewprofileBloc() : super(ViewprofileInitial()) {
    on<ViewprofileEvent>((event, emit) async {
      if (event is SignOutEvent) {
        await FirebaseAuth.instance.signOut();
        emit(NavigateToLoginState());
      }
    });
  }
}
