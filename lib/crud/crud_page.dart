import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_btl/crud/create_product.dart';
import 'package:flutter_btl/crud/service/database.dart';
import 'package:flutter_btl/static/staticColor.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CrudHomePage extends StatefulWidget {
  const CrudHomePage({super.key});

  @override
  State<CrudHomePage> createState() => _CrudHomePageState();
}

class _CrudHomePageState extends State<CrudHomePage> {
  TextEditingController namecontroller = new TextEditingController();
  final TextEditingController typecontroller = new TextEditingController();
  final TextEditingController pricecontroller = new TextEditingController();
  final TextEditingController descriptioncontroller =
      new TextEditingController();
  Stream? ProductStream;

  getLoad() async {
    ProductStream = await DatabaseMethods().getProductDetails();
    setState(() {});
  }

  @override
  void initState() {
    getLoad();
    super.initState();
  }

  Widget allProductDetails() {
    return StreamBuilder(
        stream: ProductStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: backgroundColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Name : " + ds["Name"],
                                      style: TextStyle(
                                          color: nameColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        EditProductDetail(ds["Id"]);
                                        // namecontroller = ds["Name"];
                                        // typecontroller = ds["Type"];
                                        // pricecontroller = ds["Price"];
                                        // descriptioncontroller =
                                        //     ds["Description"];
                                      },
                                      child:
                                          Icon(Icons.edit, color: editButton),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    GestureDetector(
                                        onTap: () async {
                                          await DatabaseMethods()
                                              .deleteProduct(ds["Id"])
                                              .then((value) {
                                            Fluttertoast.showToast(
                                                msg:
                                                    "Product details has been deleted successfully",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor:
                                                    sucessfullyColor,
                                                textColor: backgroundColor,
                                                fontSize: 16.0);
                                          });
                                        },
                                        child: Icon(Icons.delete,
                                            color: deleteButton))
                                  ],
                                ),
                                Text(
                                  "Type : " + ds["Type"],
                                  style: TextStyle(
                                      color: typeColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  "Price : " + ds["Price"],
                                  style: TextStyle(
                                      color: priceColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  "Description : " + ds["Description"],
                                  style: TextStyle(
                                      color: descriptionColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800),
                                ),
                              ]),
                        ),
                      ),
                    );
                  })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateProduct()));
            },
            child: const Icon(Icons.add)),
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
        body: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            children: [Expanded(child: allProductDetails())],
          ),
        ));
  }

  Future EditProductDetail(String id) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Container(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.cancel)),
                          SizedBox(
                            width: 60,
                          ),
                          Text(
                            "Edit Details",
                            style: TextStyle(
                              color: firstColor,
                              fontSize: 20,
                              fontFamily: "Poetsen One",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
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
                      Text(
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
                      Text(
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
                      Text(
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
                      SizedBox(height: 30),
                      Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            Map<String, dynamic> updateInfo = {
                              "Id": id,
                              "Name": namecontroller.text,
                              "Type": typecontroller.text,
                              "Price": pricecontroller.text,
                              "Description": descriptioncontroller.text,
                            };
                            await DatabaseMethods()
                                .updateProductDetails(id, updateInfo)
                                .then((value) {
                              Fluttertoast.showToast(
                                  msg:
                                      "Product details has been updated successfully",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: sucessfullyColor,
                                  textColor: backgroundColor,
                                  fontSize: 16.0);
                              Navigator.pop(context);
                            });
                          },
                          child: Text('Update'),
                        ),
                      )
                    ]),
              ),
            ),
          ));
}
