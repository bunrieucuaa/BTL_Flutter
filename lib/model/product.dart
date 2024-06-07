import 'package:flutter/material.dart';
import 'package:flutter_btl/static/staticColor.dart';

class Product {
  final String image, name, price, description, type;
  final Color lightColor, darkColor;
  double rating;
  int count;

  Product({
    required this.image,
    required this.name,
    required this.rating,
    required this.count,
    required this.price,
    required this.description,
    required this.type,
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
    type: "Shoes",
    description:
        "Converse 1970s là 1 trong những dòng sản phẩm bán chạy nhất của Converse. Phần đế màu trắng ngà vintage được phủ 1 lớp bóng bên ngoài là điểm nhấn riêng cho dòng 1970s, dễ vệ sinh hơn.",
  ),
  Product(
    image: "air_force_1_shadow.png",
    name: "Nike AirForce 1",
    rating: 4.5,
    price: "125.49",
    lightColor: lightColor,
    darkColor: darkColor,
    count: 1,
    type: "Sneaker",
    description:
        "Originally designed for performance hoops, the Nike Air cushioning adds lightweight, all-day comfort",
  ),
  Product(
    image: "air_force_1_shadow_2.png",
    name: "Nike AirForce 2",
    rating: 4.5,
    price: "125.49",
    lightColor: lightColor,
    darkColor: darkColor,
    count: 1,
    type: "Sneaker",
    description:
        "Originally designed for performance hoops, the Nike Air cushioning adds lightweight, all-day comfort",
  ),
  Product(
    image: "air_force_1_shadow_3.png",
    name: "Nike AirForce 3",
    rating: 4.5,
    price: "125.49",
    lightColor: lightColor,
    darkColor: darkColor,
    count: 1,
    type: "Sneaker",
    description:
        "Originally designed for performance hoops, the Nike Air cushioning adds lightweight, all-day comfort",
  ),
  Product(
      image: "sweater.png",
      name: "Uniqlo Sweater",
      rating: 4.5,
      price: "45.99",
      lightColor: lightColor,
      darkColor: darkColor,
      count: 1,
      type: "Sweater",
      description: "Smooth touch on the inside and out."),
];
