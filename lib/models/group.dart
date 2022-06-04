import 'package:flutter/material.dart';

class Group {
  final String name;
  final String image;
  
  Group({
    required this.name,
    required this.image,
  });
}

List<Group> groupDigital = [
  Group(name: "موبایل", image: "assets/images/mobile.png"),
  Group(name: "لپتاپ", image: "assets/images/laptop.png"),
  Group(name: "دوربین", image: "assets/images/camera.png"),
];

List<Group> groupClothes = [
  Group(name: "زنانه", image: "assets/images/women.png"),
  Group(name: "مردانه", image: "assets/images/men.png"),
  Group(name: "بچگانه", image: "assets/images/baby.png"),
];

List<Group> groupBook = [
  Group(name: "کتاب", image: "assets/images/book.png"),
  Group(name: "لوازم التحریر", image: "assets/images/stationery.png"),
  Group(name: "موسیقی", image: "assets/images/music.png"),
  Group(name: "صنایع دستی", image: "assets/images/handicrafts.png"),
];

List<Group> groupSport = [
  Group(name: "پوشاک ورزشی", image: "assets/images/sport cloth.png"),
  Group(name: "لوازم ورزشی", image: "assets/images/sport equipment.png"),
  Group(name: "لوازم سفر و کمپینگ", image: "assets/images/camping.png"),
];
