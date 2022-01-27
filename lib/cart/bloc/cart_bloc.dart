import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csecom/models/cart_models.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial());
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('cart');

  final CollectionReference productCollectionReference =
      FirebaseFirestore.instance.collection('products');

  List<CartModel> cartList = [];
  List<CartModel> ProductCartList = [];

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString('userid');
    if (event is CartLoadEvent) {
      final cartProduct =
          await collectionReference.where('userId', isEqualTo: userid).get();
      await Future.forEach(cartProduct.docs,
          (QueryDocumentSnapshot<Object?> element) {
        print(element['imageUrl']);

        cartList
            .add(CartModel.fromJson(element.data() as Map<String, dynamic>));
      });
      yield CartLoadState(data: cartList);
    }
  }
}
