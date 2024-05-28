import 'package:flutter/material.dart';
import 'package:flutter_btl/static/staticColor.dart';

Widget headerAppBar() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: forthColor, borderRadius: BorderRadius.circular(10)),
          child: const Icon(Icons.menu, color: firstColor),
        ),
        const Text(
          "Annee's Shop",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: firstColor,
            fontSize: 27,
            fontFamily: "Poetsen One",
          ),
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: forthColor, borderRadius: BorderRadius.circular(10)),
          child: const Icon(Icons.shopping_cart_outlined, color: firstColor),
        ),
      ],
    );
