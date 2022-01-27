import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csecom/home/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());
  FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference cart =
      FirebaseFirestore.instance.collection('cart');
  List<Product> productList = [];
  var uuid = Uuid();
  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    final prefs = await SharedPreferences.getInstance();
    print(event);
    if (event is ProductListingEvent) {
      final CollectionReference collectionReference =
          await FirebaseFirestore.instance.collection('products');
      final data = await collectionReference.get();
      await Future.forEach(data.docs, (QueryDocumentSnapshot<Object?> element) {
        productList.add(
          Product.fromJson(element.data() as Map<String, dynamic>),
        );
      });

      print(data);
      yield ProductListingState(data: productList);
    }
    if (event is UserLogoutEvent) {
      var logout = await auth.signOut();
      yield UserLogoutState();
    }
    if (event is AddToCartEvent) {
      DocumentReference reference = cart.doc();
      dynamic val;
      var userCartData = await cart
          .where('productId', isEqualTo: event.productId)
          .where('userId', isEqualTo: prefs.getString('userid'))
          .get();
      print(userCartData.docs.length);
      if (userCartData.docs.length == 0) {
        val = await cart.add({
          'cartId': uuid.v4(),
          'productId': event.productId,
          'userId': await prefs.getString('userid'),
          'quantity': 1,
          'productName': event.productName,
          'imageUrl': event.productImage,
          'price': event.price,
        });
      } else {
        for (var i in userCartData.docs) {
          await cart.doc(i.id).update({
            'quantity': i.get('quantity') + 1,
          });
        }
      }
      if (val == null) {
        yield AddToCartFailureState();
      } else {
        yield AddToCartSuccessState();
      }
    }
  }
}
