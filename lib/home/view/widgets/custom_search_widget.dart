import 'package:csecom/home/bloc/home_bloc.dart';
import 'package:csecom/home/view/widgets/productlist_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearch extends SearchDelegate<dynamic> {
  HomeBloc blocInsta = HomeBloc();
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => blocInsta..add(ProductListingEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state is ProductListingState) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                if (state.data[index].productName.startsWith(query)) {
                  return ProductDisplay(data: state.data[index]);
                } else {
                  return Container();
                }
              },
              itemCount: state.data.length,
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.green,
          ),
        );
      }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}
