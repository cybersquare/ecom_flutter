import 'package:bloc/bloc.dart';
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
      await Future<dynamic>.delayed(Duration(seconds: 5));
      yield SplashNavigateToLogin();
    }
  }
}
