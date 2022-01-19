import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settingspage_event.dart';
part 'settingspage_state.dart';

class SettingspageBloc extends Bloc<SettingspageEvent, SettingspageState> {
  SettingspageBloc() : super(SettingspageInitial()) {
    on<SettingspageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
