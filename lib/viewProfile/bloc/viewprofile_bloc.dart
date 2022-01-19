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
    if (event is SignOutEvent) {
      await FirebaseAuth.instance.signOut();
      yield NavigateToLoginState();
    }
    if (event is LoadProfileDetailsEvent) {
      final prefs = await SharedPreferences.getInstance();
      userid = prefs.getString('userid');

      final userData = await user.doc(userid).get();
      print('+++++++++++++++++++++++++++++++++++++');
      print(userData.data());
      final userDetails =
          UserDetailsModel.fromJson(userData.data() as Map<String, dynamic>);

      yield LoadProfileDetailsState(userData: userDetails);
    }

    if (event is UserUpdateEvent) {
      final prefs = await SharedPreferences.getInstance();
      userid = prefs.getString('userid');
      await user.doc(userid).update({
        'email': event.email,
        'full_name': event.userName,
      });
      yield ProfileUpdatedState();
    }
    if (event is UserAdressUpdateEvent) {
      final prefs = await SharedPreferences.getInstance();
      userid = prefs.getString('userid');
      await user.doc(userid).update({
        'address': event.adress,
      });
      print('-----------------');
      yield ProfileUpdatedState();
    }
  }

  CollectionReference user = FirebaseFirestore.instance.collection('users');
  String? userid;
}
