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
    // required this.cartId,
    required this.productId,
    // required this.userId,
  });

  // final String cartId;
  final String productId;
  // final String userId;
}
