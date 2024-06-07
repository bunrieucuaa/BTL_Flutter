import 'package:flutter/material.dart';
import 'package:flutter_btl/static/staticColor.dart';

Widget searchContainer() => Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Container(
          height: 44,
          decoration: BoxDecoration(
              color: forthColor, borderRadius: BorderRadius.circular(15)),
          child: const TextField(
            cursorColor: firstColor,
            style: TextStyle(
              color: firstColor,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: firstColor,
              ),
              hintText: "Search Your Product",
              hintStyle: TextStyle(
                  color: firstColor, fontFamily: "Poetsen One", fontSize: 15),
            ),
          )),
    );
