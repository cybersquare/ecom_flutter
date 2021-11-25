part of 'splash_bloc.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashNavigateToLogin extends SplashState {}

class SplashNavigateToHomeScreen extends SplashState {}
