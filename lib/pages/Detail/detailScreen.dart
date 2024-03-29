import 'package:example/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:example/models/ProfilePerson.dart';

class detailScreen extends StatefulWidget {
  ProfilePerson person;
  final Product product;
  detailScreen({Key? key, required this.product, required this.person})
      : super(key: key);

  @override
  State<detailScreen> createState() => _detailScreenState();
}

class _detailScreenState extends State<detailScreen> {
  String _log = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black54),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Container(
                        height: size.height,
                        padding: EdgeInsets.only(
                          top: size.height * 0.08,
                          left: 20,
                          right: 20,
                        ),
                        margin: EdgeInsets.only(top: size.height * 0.4),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 212, 196, 218)
                              .withOpacity(0.6),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "رنگ بندی",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(children: [
                                          dot(
                                              product: widget.product,
                                              color: widget.product.colors[0],
                                              isSelected: true),
                                          SizedBox(width: 20),
                                          dot(
                                              product: widget.product,
                                              color: widget.product.colors[1]),
                                          SizedBox(width: 20),
                                          dot(
                                              product: widget.product,
                                              color: widget.product.colors[2]),
                                        ]),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: Text(
                                            widget.product.description,
                                            style: TextStyle(height: 1.5),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CartCounter(),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  if (!widget
                                                      .person.sellProducts
                                                      .contains(
                                                          widget.product)) {
                                                            if(widget
                                                      .person.favourite
                                                      .contains(
                                                          widget.product)){
                                                            widget.person.favourite
                                                        .remove(widget.product);
                                                          }else{
                                                            widget.person.favourite
                                                        .add(widget.product);
                                                          }
                                                    
                                                  } else {
                                                    if(_log == ""){
                                                      _log +=
                                                        "شما فروشنده این کالا هستید";
                                                    }
                                                  }
                                                });
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color.fromARGB(
                                                        255, 212, 196, 218)),
                                                child: Image.asset(
                                                  "assets/images/heart.png",
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 50),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 58,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Color.fromARGB(
                                                      255, 212, 196, 218),
                                                ),
                                                child: IconButton(
                                                  icon: Icon(Icons
                                                      .shopping_bag_outlined),
                                                  onPressed: () {
                                                    setState(() {
                                                  if (!widget
                                                      .person.sellProducts
                                                      .contains(
                                                          widget.product)) {
                                                    widget.person.cartProducts
                                                        .add(widget.product);
                                                  } else {
                                                    if(_log == ""){
                                                      _log +=
                                                        "شما فروشنده این کالا هستید";
                                                    }
                                                  }
                                                });
                                                  },
                                                ),
                                              ),
                                              
                                              Expanded(
                                                child: SizedBox(
                                                  height: 50,
                                                  child: InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        color: Color.fromRGBO(
                                                            110, 10, 138, 1),
                                                      ),
                                                      child: Text(
                                                        "خرید",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "A Mitra 05",
                                                          color: Color.fromARGB(
                                                              209,
                                                              235,
                                                              231,
                                                              231),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          
                                        ),
                                        Text(
                                                _log,
                                                style: TextStyle(
                                                  fontFamily: "A Mitra 05",
                                                  color: Colors.red,
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              //width:300,
                              child: Text(
                                widget.product.title,
                                style: TextStyle(
                                  fontFamily: "A Mitra 05",
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Text(
                                  widget.product.rating,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                Icon(Icons.star, color: Colors.yellow),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Text(
                                  widget.product.price,
                                  style: TextStyle(
                                    fontFamily: "A Mitra 05",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: Image.asset(widget.product.image,
                                      fit: BoxFit.fitWidth),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class dot extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const dot({
    Key? key,
    required this.product,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: isSelected ? color : Colors.transparent)),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class CartCounter extends StatefulWidget {
  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        numberButton(
          Icons.remove,
          () {
            if (numOfItems > 1) {
              setState(() {
                numOfItems--;
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            numOfItems.toString(),
            style: TextStyle(
              fontFamily: "A Mitra 05",
              color: Colors.black87,
              fontSize: 13,
            ),
          ),
        ),
        numberButton(
          Icons.add,
          () {
            setState(() {
              numOfItems++;
            });
          },
        ),
      ],
    );
  }

  SizedBox numberButton(IconData icon, VoidCallback? press) {
    return SizedBox(
      width: 40,
      height: 32,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 212, 196, 218)),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.zero,
        child: InkWell(
          //borderRadius: BorderRadius.circular(15),
          onTap: press,
          child: Icon(icon),
        ),
      ),
    );
  }
}
