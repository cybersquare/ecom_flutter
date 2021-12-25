import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csecom/home/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());
  FirebaseAuth auth = FirebaseAuth.instance;
  List<Product> productList = [];

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
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
      // ignore: avoid_dynamic_calls
      yield UserLogoutState();
    }
    // yield ProductListingState(data: productList);
  }
}
