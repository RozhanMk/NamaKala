import 'package:example/models/Product.dart';
import 'package:flutter/material.dart';

class Cart {
  final Product product;
  final int numOfItems;

  Cart({required this.product, required this.numOfItems});
}

List<Cart> demoCarts = [
  Cart(product: mobileProducts[0], numOfItems: 2),
  Cart(product: mobileProducts[3], numOfItems: 1),
  Cart(product: mobileProducts[1], numOfItems: 3),
];
