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
        title: const Text(
          'View Cart',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                leading: Image.network(
                    'https://assets.myntassets.com/f_webp,dpr_1.0,q_60,w_210,c_limit,fl_progressive/assets/images/16309944/2021/12/1/9ae8aa8e-ed15-42e4-8337-27abf8c8ac0f1638337813366CasualShoes1.jpg'),
                title: const Text('Shoe'),
                subtitle: const Text('Rs. 20000'),
                trailing: InkWell(
                  child: const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                  onTap: () {
                    print("object deleted");
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
