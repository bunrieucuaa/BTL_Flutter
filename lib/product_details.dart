import 'package:flutter/material.dart';
import 'package:flutter_btl/model/product.dart';
import 'package:flutter_btl/static/staticColor.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: height,
        width: width,
        child: Stack(
          children: [
            Container(
              height: height / 2 + 55,
              color: widget.product.lightColor,
              child: Image.asset("assets/${widget.product.image}"),
            ),
            Positioned(
              top: 30,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.only(left: 6),
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                    color: iconButtonColor,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: height / 2 - 30,
                width: width,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: productDetails(),
              ),
            ),
            Positioned(
              top: height / 2 - 20,
              right: 20,
              child: Container(
                height: 108,
                width: 40,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.product.count++;
                        });
                      },
                      child: Container(
                        height: 38,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: widget.product.darkColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          Icons.add,
                          color: widget.product.lightColor,
                        ),
                      ),
                    ),
                    Text(
                      "${widget.product.count}",
                      style: TextStyle(
                          color: widget.product.darkColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (widget.product.count < 1) {
                            widget.product.count = 1;
                          }
                          widget.product.count--;
                        });
                      },
                      child: Container(
                        height: 38,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: widget.product.darkColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          Icons.remove,
                          color: widget.product.lightColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget productDetails() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.product.name,
                style: TextStyle(
                    color: widget.product.darkColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poetsen One",
                    letterSpacing: 0.8),
              ),
              Text(
                widget.product.type,
                style: TextStyle(
                    color: widget.product.darkColor.withOpacity(0.5),
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poetsen One",
                    letterSpacing: 0.8),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RatingBar.builder(
                    itemCount: 5,
                    itemSize: 18,
                    initialRating: widget.product.rating,
                    unratedColor: widget.product.darkColor.withOpacity(0.3),
                    allowHalfRating: true,
                    itemBuilder: (context, _) {
                      return Icon(
                        Icons.star_rounded,
                        color: widget.product.darkColor,
                      );
                    },
                    onRatingUpdate: (rating) {
                      setState(() {
                        widget.product.rating = rating;
                      });
                    },
                  ),
                  Text(
                    "\$${widget.product.price}",
                    style: TextStyle(
                      color: widget.product.darkColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              Text(
                widget.product.description,
                style: TextStyle(
                  color: widget.product.lightColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: widget.product.darkColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorited = !isFavorited;
                        });
                      },
                      child: Icon(
                        Icons.favorite,
                        size: 18,
                        color: isFavorited
                            ? widget.product.lightColor
                            : backgroundColor,
                      ),
                    ),
                  ),
                  Container(
                      height: 50,
                      width: 240,
                      decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: widget.product.darkColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(color: backgroundColor),
                        ),
                      ))
                ],
              )
            ],
          )
        ],
      );
}
