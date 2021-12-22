import 'package:csecom/home/home.dart';
import 'package:csecom/home/view/widgets/appbar_widget.dart';
import 'package:csecom/home/view/widgets/category_widget.dart';
import 'package:csecom/home/view/widgets/productlist_widget.dart';
import 'package:csecom/home/view/widgets/navigationbar_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => homeBloc..add(ProductListingEvent()),
      child: Scaffold(
        drawer: NavigationBar(blocInstance: homeBloc),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: HomeAppBar(),
        ),
        body: Column(
          children: [
            Container(
              height: 80,
              child: Expanded(
                child: Categories(),
              ),
            ),
            Image.asset('assets/images/banner.jpg'),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is ProductListingState) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 0,
                        childAspectRatio: 0.5,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return ProductDisplay(data: state.data[index]);
                      },
                      itemCount: state.data.length,
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
