import 'package:bloc/bloc.dart';
import 'package:csecom/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial());
  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event is SplashStartEvent) {
      await Future<dynamic>.delayed(const Duration(seconds: 4));
      if (FirebaseAuth.instance.currentUser == null) {
        print('user not logged in');
        yield SplashNavigateToLogin();
      } else {
        print('user already logged in');
        yield SplashNavigateToHomeScreen();
      }
      // yield SplashNavigateToLogin();

    }
  }
}
