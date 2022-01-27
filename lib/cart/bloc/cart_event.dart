part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartLoadEvent extends CartEvent {
  CartLoadEvent() {
    print("HELLLOOOOOO");
  }
}
