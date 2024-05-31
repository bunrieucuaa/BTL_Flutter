import 'package:flutter/material.dart';
import 'package:flutter_btl/static/staticColor.dart';

class Product {
  final String image, name, price;
  final Color lightColor, darkColor;
  double rating;
  int count;

  Product({
    required this.image,
    required this.name,
    required this.rating,
    required this.count,
    required this.price,
    required this.lightColor,
    required this.darkColor,
  });
}

final ProductList = [
  Product(
    image: "converse_shoes.png",
    name: "Converse 1970s",
    rating: 4.5,
    price: "85.99",
    lightColor: lightColor,
    darkColor: darkColor,
    count: 1,
  ),
  Product(
    image: "long_shirt.png",
    name: "Uniqlo Long Shirt",
    rating: 4.5,
    price: "50.99",
    lightColor: lightColor,
    darkColor: darkColor,
    count: 1,
  ),
  Product(
    image: "sweater.png",
    name: "Uniqlo Sweater",
    rating: 4.5,
    price: "45.99",
    lightColor: lightColor,
    darkColor: darkColor,
    count: 1,
  ),
];
