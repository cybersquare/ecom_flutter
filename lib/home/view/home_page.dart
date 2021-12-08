import 'dart:ffi';

import 'package:csecom/home/home.dart';
import 'package:csecom/home/view/widgets/appbar.dart';
import 'package:csecom/home/view/widgets/category_widget.dart';
import 'package:csecom/home/view/widgets/productList_widget.dart';
import 'package:csecom/home/view/widgets/navigationBar_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  List<Products> products = [
    Products(
        title: "Iphone 11",
        description: "Iphone 11 pro red color",
        price: 80000,
        isWishlisted: true,
        picture: "assets/images/iphone.jfif"),
    Products(
        title: "Tshirt",
        description: "Blue and white line tshirt",
        price: 800,
        isWishlisted: true,
        picture: "assets/images/tshirt.jfif"),
    Products(
        title: "Iphone 12 pro",
        description: "Iphone 12 pro goldern color",
        price: 80000,
        isWishlisted: true,
        picture: "assets/images/iphone.jfif"),
    Products(
        title: "Shoe",
        description: "Shoe in red colour",
        price: 800,
        isWishlisted: true,
        picture: "assets/images/shoe.jfif"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
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
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 0,
                childAspectRatio: 0.5,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ProdductDisplay(
                  data: products[index],
                );
              },
              itemCount: products.length,
            ),
          ),
        ],
      ),
    );
  }
}
