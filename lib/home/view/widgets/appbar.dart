import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0.0,
      backgroundColor: Colors.grey[100],
      // leading: Icon(
      //   Icons.menu,
      //   color: Colors.black,
      // ),
      title: Image.asset('assets/images/logo.jpeg'),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(
            Icons.shopping_bag_outlined,
            color: Colors.black,
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 8),
        //   child: Icon(
        //     Icons.person,
        //     color: Colors.black,
        //   ),
        // ),
      ],
    );
  }
}
