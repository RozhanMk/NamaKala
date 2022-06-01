import 'package:example/models/group.dart';
import 'package:flutter/material.dart';

class Product {
  int size, id;
  double rating, price;
  Color color;
  String image, title, description, seller;
  Group group;
  Product({
    required this.price,
    required this.size,
    required this.id,
    required this.color,
    required this.image,
    required this.title,
    required this.description,
    required this.seller,
    required this.rating,
    required this.group,
  });
}

List<Product> products = [];
