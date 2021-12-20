part of 'viewprofile_bloc.dart';

@immutable
abstract class ViewprofileState {}

class ViewprofileInitial extends ViewprofileState {}

class NavigateToLoginState extends ViewprofileState {}

class LoadProfileDetailsState extends ViewprofileState {
  LoadProfileDetailsState({required this.userData});
  final UserDetailsModel userData;
}

class ViewProfileLoadingIndicationState extends ViewprofileState {}
