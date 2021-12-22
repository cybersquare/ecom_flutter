import 'package:csecom/home/models/product_model.dart';
import 'package:csecom/home/view/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail({Key? key, required this.singleProduct}) : super(key: key);
  Product singleProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: HomeAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          elevation: 0.1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/dummyImage.png', fit: BoxFit.fill),
              ListTile(
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                        singleProduct.productName,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 27,
                        ),
                      ),
                    ),
                    // Expanded(
                    //   child: FlatButton(
                    //     onPressed: () {},
                    //     child: const Icon(
                    //       Icons.favorite,
                    //       color: Colors.pink,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      singleProduct.description,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      singleProduct.price.toString(),
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                        onPressed: () {},
                        child: Text('Add to Wishlist',
                            style: TextStyle(
                              fontSize: 17,
                            )),
                        height: 40,
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        onPressed: () {},
                        child: Text('Add to Cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            )),
                        color: Colors.pink,
                        height: 40,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
