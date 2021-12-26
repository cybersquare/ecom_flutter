class Product {
  Product({
    required this.productName,
    required this.description,
    required this.price,
    required this.quantity,
    required this.status,
    required this.imageurl,
  });

  Product.fromJson(Map<String, dynamic> json) {
    productName = json['productName'].toString();
    description = json['description'].toString();
    price = double.parse(json['price'].toString());
    quantity = int.parse(json['quantity'].toString());
    status = json['status'].toString();
    imageurl = json['imageurl'].toString();
  }

  late final String productName;
  late final String description;
  late final double price;
  late final int quantity;
  late final String status;
  late final String imageurl;

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['productName'] = productName;
    _data['description'] = description;
    _data['price'] = price;
    _data['quantity'] = quantity;
    _data['status'] = status;
    _data['imageurl'] = imageurl;
    return _data;
  }
}
