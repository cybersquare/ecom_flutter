import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csecom/viewProfile/model/user_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'viewprofile_event.dart';
part 'viewprofile_state.dart';

class ViewprofileBloc extends Bloc<ViewprofileEvent, ViewprofileState> {
  ViewprofileBloc() : super(ViewprofileInitial());
  @override
  Stream<ViewprofileState> mapEventToState(ViewprofileEvent event) async* {
    yield ViewProfileLoadingIndicationState();
    print("12323123123123123123213213");
    print(event);
    if (event is SignOutEvent) {
      await FirebaseAuth.instance.signOut();
      yield NavigateToLoginState();
    }
    if (event is LoadProfileDetailsEvent) {
      final prefs = await SharedPreferences.getInstance();
      print(prefs);
      final userid = prefs.getString('userid');
      print(userid);
      final userData = await user.doc(userid).get();
      final userDetails =
          UserDetailsModel.fromJson(userData.data() as Map<String, dynamic>);
      yield LoadProfileDetailsState(userData: userDetails);
    }
  }
  // on<ViewprofileEvent>((event, emit) async* {
  //   print("12323123123123123123213213");
  //   yield ViewProfileLoadingIndicationState();
  //   print("12323123123123123123213213");
  //   if (event is SignOutEvent) {
  //     await FirebaseAuth.instance.signOut();
  //     yield NavigateToLoginState();
  //   } else if (event is LoadProfileDetailsEvent) {
  //     final prefs = await SharedPreferences.getInstance();
  //     final userid = prefs.getString('userid');
  //     final userData = await user.doc(userid).get();
  //     final userDetails =
  //         UserDetailsModel.fromJson(userData.data() as Map<String, dynamic>);
  //     yield LoadProfileDetailsState(userData: userDetails);
  //   }
  // });

  CollectionReference user = FirebaseFirestore.instance.collection('users');
}
