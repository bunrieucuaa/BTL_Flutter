import 'package:flutter/material.dart';
import 'package:flutter_btl/crud/service/database.dart';
import 'package:flutter_btl/static/staticColor.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';

class CreateProduct extends StatefulWidget {
  const CreateProduct({super.key});

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController typecontroller = new TextEditingController();
  TextEditingController pricecontroller = new TextEditingController();
  TextEditingController descriptioncontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text(
              "Add New Product",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: firstColor,
                fontSize: 22,
                fontFamily: "Poetsen One",
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Name",
                style: TextStyle(
                    color: labelColor,
                    fontSize: 20,
                    fontFamily: "Poetsen One",
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: namecontroller,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Type",
                style: TextStyle(
                    color: labelColor,
                    fontSize: 20,
                    fontFamily: "Poetsen One",
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: typecontroller,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Price",
                style: TextStyle(
                    color: labelColor,
                    fontSize: 20,
                    fontFamily: "Poetsen One",
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: pricecontroller,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Description",
                style: TextStyle(
                    color: labelColor,
                    fontSize: 20,
                    fontFamily: "Poetsen One",
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: descriptioncontroller,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () async {
                      String Id = randomAlphaNumeric(10);
                      Map<String, dynamic> productInfoMap = {
                        "Id": Id,
                        "Name": namecontroller.text,
                        "Type": typecontroller.text,
                        "Price": pricecontroller.text,
                        "Description": descriptioncontroller.text
                      };
                      await DatabaseMethods()
                          .addProductDetails(productInfoMap, Id)
                          .then((value) {
                        Fluttertoast.showToast(
                            msg:
                                "New product details has been created successfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: sucessfullyColor,
                            textColor: backgroundColor,
                            fontSize: 16.0);
                      });
                    },
                    child: const Text(
                      "Add",
                      style: TextStyle(fontFamily: "Poetsen One", fontSize: 19),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
