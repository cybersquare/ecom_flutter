// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

// String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.isWishlisted,
    @required this.picture,
  });

  dynamic? title;
  dynamic? description;
  dynamic? price;
  dynamic? isWishlisted;
  dynamic? picture;

  factory Products.fromJson(dynamic json) => Products(
        title: json["title"],
        description: json["description"],
        price: json["price"],
        isWishlisted: json["isWishlisted"],
        picture: json["picture"],
      );

  // dynamic toJson() => <dynamic>{
  //     "title": title,
  //     "description": description,
  //     "price": price,
  //     "isWishlisted": isWishlisted,
  //     "picture": picture,
  // };
}
