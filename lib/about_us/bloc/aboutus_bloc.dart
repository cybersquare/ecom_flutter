import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'aboutus_event.dart';
part 'aboutus_state.dart';

class AboutusBloc extends Bloc<AboutusEvent, AboutusState> {
  AboutusBloc() : super(AboutusInitial()) {
    on<AboutusEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
