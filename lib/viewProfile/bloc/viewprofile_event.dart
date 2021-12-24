part of 'viewprofile_bloc.dart';

@immutable
abstract class ViewprofileEvent {}

class SignOutEvent extends ViewprofileEvent {}

class LoadProfileDetailsEvent extends ViewprofileEvent {
  LoadProfileDetailsEvent();
}

class UserUpdateEvent extends ViewprofileEvent {
  UserUpdateEvent({required this.userName, required this.email});
  String userName;
  String email;
}

class UserAdressUpdateEvent extends ViewprofileEvent {
  UserAdressUpdateEvent({required this.adress});
  String adress;
}
