import 'package:example/models/Cart.dart';
import 'package:example/models/Product.dart';
import 'package:flutter/material.dart';

class ProfilePerson {
  String name, phone, password, email, store;
  List<Product> sellProducts, cartProducts, favourite;
  ProfilePerson(this.name, this.phone, this.password, this.email, this.store,
  this.sellProducts, this.cartProducts,this.favourite);
}
List<ProfilePerson> persons = [];
