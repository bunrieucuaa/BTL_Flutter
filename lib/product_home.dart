import 'package:flutter/material.dart';
import 'package:flutter_btl/model/product.dart';
import 'package:flutter_btl/product_component/row_header.dart';
import 'package:flutter_btl/product_component/search_container.dart';
import 'package:flutter_btl/product_details.dart';
import 'package:flutter_btl/static/staticColor.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductHomePage extends StatefulWidget {
  const ProductHomePage({super.key});

  @override
  State<ProductHomePage> createState() => _ProductHomePageState();
}

class _ProductHomePageState extends State<ProductHomePage> {
  //ListView Category
  List<Map<String, dynamic>> categoriesList = [
    {
      "icon": Icons.icecream,
      "label": "Shoes",
    },
    {
      "icon": Icons.cake,
      "label": "Shirt",
    },
    {
      "icon": Icons.forum_outlined,
      "label": "T-Shirt",
    },
    {
      "icon": Icons.cabin,
      "label": "Sweater",
    },
  ];

  List<Product> products = ProductList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
            child: Container(
              height: MediaQuery.of(context).size.height / 2 - 100,
              //MediaQuery cho phép truy cập vào kích thước và định dạng của màn hình thiết bị
              // color: Colors.yellow,
              child: Column(
                children: [
                  Column(
                    children: [
                      headerAppBar(),
                      searchContainer(),
                      categoryListView(),
                      titleLine()
                    ],
                  )
                ],
              ),
            ),
          ),
          popularProducts()
        ],
      ),
    );
  }

  //Category List View
  Widget categoryListView() => Container(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
          itemBuilder: (context, index) {
            final category = categoriesList[index];
            return Container(
              height: 100,
              width: 60,
              margin: const EdgeInsets.only(
                  right: 29), //Margin right cho từng phần tử
              child: Column(
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        color: forthColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(category["icon"], size: 28, color: firstColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    category["label"],
                    style: const TextStyle(
                        color: firstColor,
                        fontFamily: "Poetsen One",
                        fontSize: 15),
                  )
                ],
              ),
            );
          },
        ),
      );

  //Popular Product Title
  Widget titleLine() => const Row(
        children: [
          Text(
            "Popular",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                color: firstColor,
                fontFamily: "Poetsen One",
                fontWeight: FontWeight.w600),
          ),
        ],
      );

  Widget popularProducts() => Container(
        height: 320,
        margin: const EdgeInsets.only(left: 20),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProductDetails(product: product)));
              },
              child: Container(
                width: 260,
                height: 320,
                margin: const EdgeInsets.only(right: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: product.lightColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 210,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/${product.image}"),
                              fit: BoxFit.cover)),
                    ),
                    Text(
                      product.name,
                      style: TextStyle(
                        color: product.darkColor,
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RatingBar.builder(
                          itemCount: 5,
                          itemSize: 18,
                          initialRating: product.rating,
                          allowHalfRating: true,
                          itemBuilder: (context, _) {
                            return Icon(
                              Icons.star_rounded,
                              color: product.darkColor,
                            );
                          },
                          onRatingUpdate: (rating) {
                            setState(() {
                              product.rating = rating;
                            });
                          },
                        ),
                        Text(
                          "\$${product.price}",
                          style: TextStyle(
                            color: product.darkColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
}
