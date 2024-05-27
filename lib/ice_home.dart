import 'package:flutter/material.dart';
import 'package:flutter_btl/static/staticColor.dart';

class IceCreamHomePage extends StatefulWidget {
  const IceCreamHomePage({super.key});

  @override
  State<IceCreamHomePage> createState() => _IceCreamHomePageState();
}

class _IceCreamHomePageState extends State<IceCreamHomePage> {
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
        body: Padding(
          padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
          child: Container(
            height: MediaQuery.of(context).size.height / 2 - 70,
            //MediaQuery cho phép truy cập vào kích thước và định dạng của màn hình thiết bị
            // color: Colors.yellow,
            child: Column(
              children: [
                Column(
                  children: [
                    headerAppBar(),
                    searchContainer(),
                    categoryListView()
                  ],
                )
              ],
            ),
          ),
        ));
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
        padding: const EdgeInsets.only(top: 15, bottom: 15),
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
}
