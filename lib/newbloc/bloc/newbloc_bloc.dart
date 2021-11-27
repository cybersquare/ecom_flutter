import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'newbloc_event.dart';
part 'newbloc_state.dart';

class NewblocBloc extends Bloc<NewblocEvent, NewblocState> {
  NewblocBloc() : super(NewblocInitial()) {
    on<NewblocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
