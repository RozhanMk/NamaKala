import 'package:example/models/Cart.dart';
import 'package:example/models/Product.dart';
import 'package:example/pages/Detail/detailScreen.dart';
import 'package:flutter/material.dart';
import 'package:example/pages/Products/productsScreen.dart';

class cartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        
        title: Column(
          children: [
            Text(
              "سبد من",
              style: TextStyle(
                color: Colors.black54,
                fontFamily: "A Mitra 05",
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50),
                  ItemBox(context, demoCarts[0].product, demoCarts[0].numOfItems.toString()),
                  SizedBox(height: 50),
                  ItemBox(context, demoCarts[1].product, demoCarts[1].numOfItems.toString()),
                  SizedBox(height: 50),
                  ItemBox(context, demoCarts[2].product, demoCarts[2].numOfItems.toString()),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Directionality(
        
        textDirection: TextDirection.rtl,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width/15,
            horizontal: MediaQuery.of(context).size.width/30
          ),
          height:130,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow:[ BoxShadow(
              blurRadius: 15,
              color: Colors.black45.withOpacity(0.4),
            ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: (){},
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(110, 10, 138, 1),
                      ),
                      child: Text(
                        "خرید",
                        style: TextStyle(
                          fontFamily: "A Mitra 05",
                          color: Color.fromARGB(209, 235, 231, 231),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                                                
                  ),
                  SizedBox(width:50),
                  Text(
                        "کل: ",
                        style: TextStyle(
                          fontFamily: "A Mitra 05",
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                  ),
                  Text(
                        "138,952,000 تومان",
                        style: TextStyle(
                          fontFamily: "A Mitra 05",
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
Row ItemBox(BuildContext context,Product item, String numOfItems) {
    return Row(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //SizedBox(height: 80),
                  Expanded(
                    child: InkWell(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal:8),
                        height: 180,
                        //width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color.fromARGB(255, 212, 196, 218).withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(item.image),
                      ),
                      onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => detailScreen(product: item),
                          ));
                    }),
                    ),
                
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.all(8),
                        width:200,
                        child: Text(
                          item.title,
                          style: TextStyle(
                            fontFamily: "A Mitra 05",
                          ),
                        ),
                      ),
                      Text(
                      item.price,
                      style: TextStyle(
                          fontFamily: "A Mitra 05",
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                      numOfItems+ " X",
                      style: TextStyle(
                        color: Color.fromRGBO(110, 10, 138, 1),
                          fontFamily: "A Mitra 05",
                        ),
                  ),
                    ],
                  ),

                  

                ]
              );
  }


