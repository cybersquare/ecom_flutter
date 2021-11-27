import 'package:bloc/bloc.dart';
import 'package:csecom/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

// class SplashBloc extends Bloc<SplashEvent, SplashState> {
//   SplashBloc _splashBloc = SplashBloc();
//   SplashBloc() : super(SplashInitial()) {
//     // on<SplashEvent>((event, emit) {
//     //   // TODO: implement event handler
//     // });

//     @override
//     Stream <SplashState> mapEventToState(spla)
//   }
// }

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial());
  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event is SplashStartEvent) {
      if (FirebaseAuth.instance.currentUser == null) {
        await Future<dynamic>.delayed(const Duration(seconds: 2));
        print("user not logged in");
        emit(SplashNavigateToLogin());
      } else {
        print("user already logged in");
        emit(SplashNavigateToHomeScreen());
      }
      // yield SplashNavigateToLogin();

    }
  }
}
