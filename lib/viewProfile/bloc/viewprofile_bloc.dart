import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'viewprofile_event.dart';
part 'viewprofile_state.dart';

class ViewprofileBloc extends Bloc<ViewprofileEvent, ViewprofileState> {
  ViewprofileBloc() : super(ViewprofileInitial()) {
    on<ViewprofileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
