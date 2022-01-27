import 'package:csecom/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatelessWidget {
  Cart({Key? key}) : super(key: key);
  CartBloc _cartBloc = CartBloc();
  double totalprice = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cartBloc..add(CartLoadEvent()),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.grey[100],
          title: const Text(
            'Your Cart',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoadState) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  print(state.data[index].price);
                  totalprice = totalprice + state.data[index].price;
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Card(
                          child: ListTile(
                            leading:
                                // Text(
                                //   state.data[index].imageUrl.toString(),
                                // ),
                                Image.network(
                              state.data[index].imageUrl.toString(),
                            ),
                            title:
                                Text(state.data[index].productName.toString()),
                            subtitle:
                                Text('₹${state.data[index].price.toString()}'),
                            trailing: InkWell(
                              child: const Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                              onTap: () {},
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: state.data.length,
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
