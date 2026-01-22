import 'package:coffe_shop/Components/ProductDetailPage_Components/addtocart_container.dart';
import 'package:coffe_shop/Components/ProductDetailPage_Components/app_bar.dart';
import 'package:coffe_shop/Components/ProductDetailPage_Components/price_column.dart';
import 'package:coffe_shop/Components/ProductDetailPage_Components/size_container.dart';
import 'package:coffe_shop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:readmore/readmore.dart';

class ProductDetialPage extends StatefulWidget {
  const ProductDetialPage({
    super.key,
    required this.product,
    //required this.isFavorite,
  });
  final Product product;
  // final bool isFavorite;

  @override
  State<ProductDetialPage> createState() => _ProductDetialPageState();
}

class _ProductDetialPageState extends State<ProductDetialPage> {
  int selectedIndexSize = 1;
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 75),
              ProductDetailAppBar(product: widget.product),
              SizedBox(height: 30),
              //product image
              Container(
                height: 200,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: NetworkImage(widget.product.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: TextStyle(
                          fontFamily: 'Sora',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.product.title,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Sora',
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(IconlyBold.star, color: Colors.yellow),
                          SizedBox(width: 5),
                          Text(
                            widget.product.rate.toString(),
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "$quantity",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffc47c51),
                            ),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              icon: Icon(Icons.add, color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffc47c51),
                            ),
                            child: IconButton(
                              onPressed: () {
                                if (quantity > 1) {
                                  setState(() {
                                    quantity--;
                                  });
                                }
                              },
                              icon: Icon(Icons.remove, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5),
              ///////////////////////////////////////////////////////////////////////////////////////////////////////
              Divider(),

              ////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(height: 10),
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              ReadMoreText(
                style: TextStyle(color: Colors.grey),
                widget.product.description ?? 'No Description',
                trimMode: TrimMode.Line,
                trimLines: 2,
                colorClickableText: Color(0xffc67c4f),
                trimCollapsedText: 'Read more',
                trimExpandedText: 'Show less',
                moreStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffc67c4f),
                ),
                lessStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffc67c4f),
                ),
              ),
              SizedBox(height: 15),
              Text("Size", style: TextStyle(fontSize: 24, fontFamily: 'Sora')),
              SizedBox(height: 20),

              // size selection row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndexSize = 0;
                      });
                    },
                    child: SizeContainer(
                      text: "S",
                      isSelected: selectedIndexSize == 0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndexSize = 1;
                      });
                    },
                    child: SizeContainer(
                      text: "M",
                      isSelected: selectedIndexSize == 1,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndexSize = 2;
                      });
                    },
                    child: SizeContainer(
                      text: "L",
                      isSelected: selectedIndexSize == 2,
                    ),
                  ),
                ],
              ),
              //////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  PriceColumn(
                    widget: widget,
                    selectedIndexSize: selectedIndexSize,
                    quantity: quantity,
                  ),
                  Spacer(),
                  AddToCartContainer(),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
