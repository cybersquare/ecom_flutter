part of 'viewprofile_bloc.dart';

@immutable
abstract class ViewprofileEvent {}

class SignOutEvent extends ViewprofileEvent {}

class LoadProfileDetailsEvent extends ViewprofileEvent {
  LoadProfileDetailsEvent() {
    print("object");
  }
}
