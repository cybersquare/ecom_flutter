import 'package:csecom/home/bloc/home_bloc.dart';
import 'package:csecom/home/models/product_model.dart';
import 'package:csecom/home/view/widgets/product_detail_widget.dart';
import 'package:flutter/material.dart';

class ProductDisplay extends StatelessWidget {
  ProductDisplay({Key? key, required this.data}) : super(key: key);
  Product data;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) =>
                ProductDetail(singleProduct: data),
          ),
        );
      },
      child: Card(
        elevation: 0.1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              data.imageurl,
              fit: BoxFit.fill,
            ),
            ListTile(
              title: Row(
                children: [
                  Expanded(
                    child: Text(
                      data.productName,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    data.description,
                  ),
                  Text(
                    data.price.toString(),
                    style: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
