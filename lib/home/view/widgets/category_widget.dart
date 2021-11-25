import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  Categories({Key? key}) : super(key: key);
  final category = [
    {'category': 'Women', 'image': 'assets/images/women.png'},
    {'category': 'Men', 'image': 'assets/images/men.jfif'},
    {'category': 'Footwear', 'image': 'assets/images/footwear.jfif'},
    {'category': 'Accessories', 'image': 'assets/images/accessories.jfif'},
    {'category': 'Gadgets', 'image': 'assets/images/gadgets.jfif'},
    {'category': 'Kids', 'image': 'assets/images/kids.jfif'},
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: Image.asset(
                  category[index].values.last,
                  width: 50,
                  height: 50,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                  child: Text(
                category[index].values.first,
                style: TextStyle(),
              )),
            ],
          ),
        );
      },
      itemCount: category.length,
    );
  }
}
