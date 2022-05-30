import 'package:flutter/material.dart';

class Product {
  int price, size, id;
  Color color;
  String image, title, description, seller;
  String folder, file;
  Product({
    required this.price,
    required this.size,
    required this.id,
    required this.color,
    required this.image,
    required this.title,
    required this.description,
    required this.seller,
    required this.folder,
    required this.file,
  });
}

List<Product> products = [];
