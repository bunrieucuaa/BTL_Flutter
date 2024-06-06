import 'package:flutter/material.dart';
import 'package:flutter_btl/crud/create_product.dart';
import 'package:flutter_btl/static/staticColor.dart';

class CrudHomePage extends StatefulWidget {
  const CrudHomePage({super.key});

  @override
  State<CrudHomePage> createState() => _CrudHomePageState();
}

class _CrudHomePageState extends State<CrudHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CreateProduct()));
          }, child: const Icon(Icons.add)),
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Flutter Crud With Firebase",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: firstColor,
                fontSize: 20,
                fontFamily: "Poetsen One",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
