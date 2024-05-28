import 'package:flutter/material.dart';
// import 'package:flutter_btl/product_component/row_header.dart';
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
      "icon": Icons.cabin,
      "label": "Cabin",
    },
    {
      "icon": Icons.cabin,
      "label": "Cabin",
    },
    {
      "icon": Icons.cabin,
      "label": "Cabin",
    },
    {
      "icon": Icons.cabin,
      "label": "Cabin",
    },
  ];

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

  //Row Header
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

  //Row search bar
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
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              width: 260,
              height: 320,
              margin: const EdgeInsets.only(right: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: forthColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 210,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/converse_shoes.png"),
                            fit: BoxFit.cover)),
                  ),
                  const Text(
                    "Converse 1970s",
                    style: TextStyle(
                      color: firstColor,
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
                        initialRating: 4.5,
                        allowHalfRating: true,
                        itemBuilder: (context, _) {
                          return const Icon(
                            Icons.star_rounded,
                            color: firstColor,
                          );
                        },
                        onRatingUpdate: (rating) {},
                      ),
                      const Text(
                        "\$50.99",
                        style: TextStyle(
                          color: firstColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      );
}
