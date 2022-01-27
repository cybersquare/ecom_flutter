import 'dart:convert';

// CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

// String cartModelToJson(CartModel data) => json.encode(data.toJson());

// class CartModel {
//   CartModel({
//     required this.cartId,
//     required this.productId,
//     required this.quantity,
//     required this.userId,
//   });

//   dynamic cartId;
//   dynamic productId;
//   dynamic quantity;
//   dynamic userId;

//   factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
//         cartId: json['cartId'],
//         productId: json['productId'],
//         quantity: json['quantity'],
//         userId: json['userId'],
//       );

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'cartId': cartId,
//         'productId': productId,
//         'quantity': quantity,
//         'userId': userId,
//       };
// }

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    required this.cartId,
    required this.productId,
    required this.quantity,
    required this.userId,
    required this.imageUrl,
    required this.productName,
    required this.price,
  });
  factory CartModel.fromJson(dynamic json) => CartModel(
        cartId: json['cartId'],
        productId: json['productId'] as String,
        quantity: json['quantity'] as int,
        userId: json['userId'] as String,
        imageUrl: json['imageUrl'] as String,
        productName: json['productName'] as String,
        price: json['price'] as double,
      );

  dynamic cartId;
  dynamic productId;
  dynamic quantity;
  dynamic userId;
  // dynamic image;
  dynamic productName;
  double price;
  dynamic imageUrl;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'cartId': cartId,
        'productId': productId,
        'quantity': quantity,
        'userId': userId,
        'imageUrl': imageUrl,
        'productName': productName,
        'price': price,
      };
}
