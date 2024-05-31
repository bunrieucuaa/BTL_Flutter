import 'package:flutter/material.dart';
import 'package:flutter_btl/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}


//last check 9:33 27/05/2024 
//last check 13:33 28/05/2024
//last check 24:47 1/06/2024
