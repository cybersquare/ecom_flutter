part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class ProductListingEvent extends HomeEvent {}

class UserLogoutEvent extends HomeEvent {}

class AddToCartEvent extends HomeEvent {
  AddToCartEvent({
    required this.productImage,
    required this.productId,
    required this.productName,
    required this.price,
  });

  final String productImage;
  final String productId;
  final String productName;
  final double price;
}
