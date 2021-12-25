part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class ProductListingState extends HomeState {
  ProductListingState({required this.data});

  @override
  List<Object?> get props => [data];

  // List<Product> data;
  List<Product> data;
}

class UserLogoutState extends HomeState {}
