import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.grey[100],
        title: const Text('View Cart'),
      ),
      body: Column(
        children: [
          InkWell(
            child: const Card(
              child: ListTile(
                title: Text('Codesinsider.com'),
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
